#!/bin/bash

# 每日学习推送脚本
# 用于向用户发送当天的Go学习内容

LOG_FILE="/root/.openclaw/workspace/automation-workflows/logs/daily-push.log"
DATE=$(date '+%Y-%m-%d')
DAY_NUMBER=$(( ($(date -d "$DATE" +%s) - $(date -d "2026-02-26" +%s)) / 86400 + 1 ))

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 开始执行每日学习推送" >> "$LOG_FILE"

# 检查是否有当天的推送文件
PUSH_FILE="/root/.openclaw/workspace/go-learning/daily-push/${DATE}-day${DAY_NUMBER}.md"

if [[ -f "$PUSH_FILE" ]]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 找到推送文件: $PUSH_FILE" >> "$LOG_FILE"
    
    # 读取推送内容
    CONTENT=$(cat "$PUSH_FILE")
    
    # 发送推送（使用openclaw message命令）
    if command -v openclaw >/dev/null 2>&1; then
        echo "$CONTENT" | openclaw message send --channel feishu --target "ou_0e8a1150105275ba817a4350097db1e3" --message "$(cat)" >> "$LOG_FILE" 2>&1
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] 推送完成" >> "$LOG_FILE"
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] openclaw工具不可用，跳过推送" >> "$LOG_FILE"
    fi
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 未找到推送文件: $PUSH_FILE" >> "$LOG_FILE"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 尝试使用计划表内容" >> "$LOG_FILE"
    
    # 如果没有具体的推送文件，尝试从学习计划表中提取内容
    PLAN_FILE="/root/.openclaw/workspace/go-learning/Go语言每日学习计划-56天推送表.md"
    if [[ -f "$PLAN_FILE" ]]; then
        # 提取第$DAY_NUMBER天的内容
        CONTENT=$(grep -A 20 "第${DAY_NUMBER}天 - " "$PLAN_FILE" | head -25)
        
        if [[ -n "$CONTENT" ]]; then
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] 从计划表提取到内容" >> "$LOG_FILE"
            
            # 发送推送
            if command -v openclaw >/dev/null 2>&1; then
                echo "$CONTENT" | openclaw message send --channel feishu --target "ou_0e8a1150105275ba817a4350097db1e3" --message "$(cat)" >> "$LOG_FILE" 2>&1
                echo "[$(date '+%Y-%m-%d %H:%M:%S')] 推送完成" >> "$LOG_FILE"
            else
                echo "[$(date '+%Y-%m-%d %H:%M:%S')] openclaw工具不可用，跳过推送" >> "$LOG_FILE"
            fi
        else
            echo "[$(date '+%m-%d %H:%M:%S')] 无法从计划表提取第${DAY_NUMBER}天内容" >> "$LOG_FILE"
        fi
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] 学习计划表文件不存在: $PLAN_FILE" >> "$LOG_FILE"
    fi
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 每日学习推送脚本执行完成" >> "$LOG_FILE"