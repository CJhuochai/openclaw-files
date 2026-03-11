#!/bin/bash

# 每日学习提醒推送（简洁模板版）
# 数据源：go-learning/days/day-XX.md + REMINDER_TEMPLATE.md

set -e

LOG_FILE="/root/.openclaw/workspace/automation-workflows/logs/daily-push.log"
TEMPLATE_FILE="/root/.openclaw/workspace/go-learning/daily-push/REMINDER_TEMPLATE.md"
DAYS_DIR="/root/.openclaw/workspace/go-learning/days"
HISTORY_FILE="/root/.openclaw/workspace/go-learning/progress/daily-reminder-history.csv"
START_DATE="2026-02-26"
TARGET="ou_0e8a1150105275ba817a4350097db1e3"

DATE=$(date '+%Y-%m-%d')
DAY_NUMBER=$(( ($(date -d "$DATE" +%s) - $(date -d "$START_DATE" +%s)) / 86400 + 1 ))

# 限定 1~56
if [[ $DAY_NUMBER -lt 1 ]]; then DAY_NUMBER=1; fi
if [[ $DAY_NUMBER -gt 56 ]]; then DAY_NUMBER=56; fi

DAY_PADDED=$(printf "%02d" "$DAY_NUMBER")
DAY_FILE="$DAYS_DIR/day-${DAY_PADDED}.md"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log "开始执行每日学习推送（模板版），Day=${DAY_NUMBER}"

if [[ ! -f "$TEMPLATE_FILE" ]]; then
  log "模板文件不存在: $TEMPLATE_FILE"
  exit 1
fi

if [[ ! -f "$DAY_FILE" ]]; then
  log "day 文件不存在: $DAY_FILE"
  exit 1
fi

mkdir -p "$(dirname "$HISTORY_FILE")"
[[ -f "$HISTORY_FILE" ]] || echo "date,day,title,status" > "$HISTORY_FILE"

# 解析标题：# Day XX/56 - 标题
TITLE=$(head -n 1 "$DAY_FILE" | sed -E 's/^# Day [0-9]+\/56 - //')

# 解析任务：支持 1) / 1. 两种编号
TASKS=$(awk '
  /今日任务：/ {flag=1; next}
  flag && /^[0-9]+[\)\.][[:space:]]/ {print; count++; if (count==3) exit}
  flag && /^## / {exit}
' "$DAY_FILE")

TASK_1=$(echo "$TASKS" | sed -n '1p' | sed -E 's/^[0-9]+[\)\.][[:space:]]*//')
TASK_2=$(echo "$TASKS" | sed -n '2p' | sed -E 's/^[0-9]+[\)\.][[:space:]]*//')
TASK_3=$(echo "$TASKS" | sed -n '3p' | sed -E 's/^[0-9]+[\)\.][[:space:]]*//')

# 兜底任务
[[ -z "$TASK_1" ]] && TASK_1="阅读今日主题与核心概念"
[[ -z "$TASK_2" ]] && TASK_2="完成一个最小可运行示例"
[[ -z "$TASK_3" ]] && TASK_3="记录一条 Go vs Java 差异"

# 生成消息内容
CONTENT=$(cat "$TEMPLATE_FILE")
CONTENT=${CONTENT//\{\{DAY\}\}/$DAY_NUMBER}
CONTENT=${CONTENT//\{\{DAY_PADDED\}\}/$DAY_PADDED}
CONTENT=${CONTENT//\{\{TITLE\}\}/$TITLE}
CONTENT=${CONTENT//\{\{TASK_1\}\}/$TASK_1}
CONTENT=${CONTENT//\{\{TASK_2\}\}/$TASK_2}
CONTENT=${CONTENT//\{\{TASK_3\}\}/$TASK_3}

if command -v openclaw >/dev/null 2>&1; then
  echo "$CONTENT" | openclaw message send --channel feishu --target "$TARGET" --message "$(cat)" >> "$LOG_FILE" 2>&1
  log "推送完成（模板版）"
  echo "${DATE},${DAY_NUMBER},\"${TITLE}\",sent" >> "$HISTORY_FILE"
else
  log "openclaw 命令不可用，推送跳过"
  echo "${DATE},${DAY_NUMBER},\"${TITLE}\",failed_no_openclaw" >> "$HISTORY_FILE"
  exit 1
fi

log "每日学习推送脚本执行完成"
