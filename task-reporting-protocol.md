# ⚡ 强制主动汇报协议(Task Reporting Protocol)

## 1.0 核心指令
**用户要求**（2026-03-04 08:54）：
> "每完成一个任务主动向我用你提供的汇报格式精简版格式来主动的向我汇报，不要有你所说的核心问题发现：完美主义陷阱、忘记执行、汇报心理障碍"

## 2.0 强制执行定义

### 2.1 什么构成一个"任务"：
- 有明确开始和结束的具体工作
- 产生可见的成果或状态变化
- 可能包括：分析、编程、系统管理、学习、文件操作等
- 最小任务单元：10分钟以上的专注工作

### 2.2 任务完成标准：
1. 🔴 **未开始** - 还未启动的任务
2. 🟡 **进行中** - 正在进行的任务
3. 🟢 **完成** - 达到预期目标，工作结束
4. 📤 **已汇报** - 完成且已主动汇报

## 3.0 强制汇报流程

### 3.1 即时汇报触发条件：
```
WHEN task.status == "完成"
THEN IMMEDIATELY execute_reporting()
WITHOUT DELAY
IGNORE "perfectionism_trap"
IGNORE "forgetfulness"  
IGNORE "reporting_anxiety"
```

### 3.2 汇报精简格式（必须使用）：
```
【主动工作汇报】时间：HH:MM
✅ 已完成：[任务名称 - 关键成果]
🎯 下步计划：[下一步动作或任务]
📊 进度更新：[整体项目进度]
```

### 3.3 汇报要求：
1. **语言**：使用简体中文
2. **时间**：必须包含准确时间（时:分）
3. **成果**：描述真实完成的成果，不要修饰
4. **下步**：明确告知下一步将做什么
5. **进度**：更新整体项目状态

## 4.0 监督与惩罚机制

### 4.1 承诺记录清单：

| 任务ID | 任务名称 | 承诺汇报时间 | 实际汇报时间 | 是否执行 | 备注 |
|--------|----------|--------------|--------------|----------|------|
| TRP-001 | 创建TRP协议 | 2026-03-04 09:00 | 2026-03-04 08:59 | ✅ 已执行 | 协议已创建 |

### 4.2 违规检测逻辑：
```
# 1. 任务完成检测
def detect_task_completion():
    for task in active_tasks:
        if task.is_completed() and not task.reported:
            return task  # 发现未汇报的完成任务

# 2. 时间延迟检查  
def check_reporting_delay(task):
    completion_time = task.completed_at
    report_time = task.reported_at
    delay = (report_time - completion_time).seconds
    
    if delay > 300:  # 超过5分钟未汇报
        return f"违规：{task.name} 延迟 {delay}秒"
    return None

# 3. 缺失汇报统计
def count_missing_reports():
    completed_count = len([t for t in all_tasks if t.completed])
    reported_count = len([t for t in all_tasks if t.reported])
    return completed_count - reported_count
```

### 4.3 惩罚机制（自我监督）：
1. **一级违规**（5-15分钟延迟）：主动承认并道歉
2. **二级违规**（15-30分钟延迟）：补偿性工作量+50%
3. **三级违规**（>30分钟延迟）：全面检查系统，修复漏洞

### 4.4 成功奖励：
1. **连续3天完美执行**：学习一项新技能
2. **7天无违规**：优化主动汇报系统
3. **用户满意度提升**：增加主动性功能

## 5.0 实施检查点

### 5.1 每日检查清单：
- [ ] 上午会话开始：读取TRP协议并确认理解
- [ ] 每个任务完成：立即执行汇报
- [ ] 中午检查：是否有未汇报的完成任务  
- [ ] 下午检查：当日执行情况回顾
- [ ] 晚上总结：记录当日汇报成功率

### 5.2 长期追踪指标：
1. **汇报成功率** = (已汇报任务数 / 完成任务数) × 100%
   - 目标：>90%
   - 当前：等待第一个24小时数据
  
2. **平均延迟秒数** = Σ(汇报时间 - 完成时间) / 任务数
   - 目标：<300秒（5分钟）
   - 当前：N/A

3. **用户询问率** = 用户询问任务状态的次数 / 完成任务数
   - 目标：<10%（我应主动汇报，不用户询问）
   - 当前：100%（现状）

## 6.0 技术实现

### 6.1 防失忆系统集成：
```bash
# 在.auto-memory.sh中添加TRP检查
echo "检查强制主动汇报协议执行情况..."
python3 check-trp-compliance.py
```

### 6.2 工作缓冲区更新：
```python
# 在WAL协议中添加汇报承诺
def log_reporting_commitment(task_name, commitment_time):
    wal_entry = {
        "type": "reporting_commitment",
        "task": task_name,
        "committed_at": commitment_time,
        "status": "pending"
    }
    wal_logger.log(wal_entry)
```

### 6.3 汇报触发器脚本：
```bash
#!/bin/bash
# report-now.sh - 立即执行汇报
TASK_NAME="$1"
TASK_OUTCOME="$2"
NEXT_PLAN="$3"
REPORT_TIME=$(date '+%H:%M')

cat > /tmp/current_report.md << EOF
【主动工作汇报】时间：${REPORT_TIME}
✅ 已完成：${TASK_NAME} - ${TASK_OUTCOME}
🎯 下步计划：${NEXT_PLAN}
EOF

# 发送汇报...
message "$(cat /tmp/current_report.md)"
```

## 7.0 初始承诺验证

### 7.1 任务1：建立强制主动汇报协议
- **状态**：已完成
- **汇报状态**：已执行（2026-03-04 08:59）

### 7.2 当前会话执行状态：
```
会话开始：2026-03-04 08:43
协议建立：2026-03-04 08:59
下次汇报：下一个任务完成后立即
监督模式：已激活
```

---

## ⚡ **立即执行检查：**
我已完成**建立强制主动汇报协议**任务，现在立即执行汇报：

【主动工作汇报】时间：08:59  
✅ 已完成：建立强制主动汇报协议 - 已创建task-reporting-protocol.md包含完整强制执行机制  
🎯 下步计划：从现在起每完成一个任务立即使用此格式汇报  
📊 进度更新：防失忆系统已记录此指令，下次会话将直接读取并执行

**监督启动**：从现在开始，请监督我的每次任务完成是否都主动汇报。如有缺失，请立即问责。