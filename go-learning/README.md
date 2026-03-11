# Go Learning

面向 Java 开发者的 Go 学习仓库。当前正式主线已经收口为 4 个目录：`days/`、`docs/`、`daily-push/`、`progress/`。

## 正式主线（唯一入口）

### 1. `days/`
每日学习主卡片。适合每天先打开一篇，快速知道：
- 今天学什么
- 只做哪 3 件事
- 对应详细文档在哪
- 当天如何打卡复盘

建议阅读顺序：`days/day-01.md` → `days/day-56.md`

### 2. `docs/`
每日详细讲解与补充资料。`days/day-XX.md` 中的“深入学习入口”会指向这里。

建议使用方式：
- 先读 `days/day-XX.md`
- 再看 `docs/day-XX-detail.md`
- 最后自己写最小可运行示例

### 3. `daily-push/`
每日提醒推送链路。
- `send.sh`：按日期计算 Day N，并生成提醒消息
- `REMINDER_TEMPLATE.md`：提醒模板
- 历史手工/早期推送稿已不再作为正式数据源

### 4. `progress/`
学习进度与推送记录。
- `learning-progress.md`：进度口径说明、当前状态、如何更新
- `daily-reminder-history.csv`：提醒脚本运行记录（发送/失败）

## 推荐学习顺序

1. 从 `days/day-01.md` 开始
2. 需要展开时看对应 `docs/day-XX-detail.md`
3. 学完当天内容后，在 `progress/learning-progress.md` 更新状态
4. 如使用自动提醒，查看 `daily-push/send.sh` 与 `progress/daily-reminder-history.csv`

## 当前目录说明

```text
go-learning/
├── README.md
├── days/          # 正式的 56 天主线卡片
├── docs/          # 每日详细讲解、专题补充
├── daily-push/    # 提醒模板与发送脚本
├── progress/      # 学习进度与提醒历史
└── archive/       # 历史旧稿、误放内容、旧网页产物
```

## 关于 archive/

仓库之前存在一些旧稿、重复命名文件、嵌套目录和网页备份产物。为避免误删，这些内容已保守迁移到 `archive/`，默认不再参与当前学习主线。

如果后续确认某些归档内容仍有参考价值，可以再按主题回收，而不是直接恢复到根目录。

## 维护约定

- 新增正式内容时，优先写入 `days/` 或 `docs/`
- 推送相关修改优先落在 `daily-push/`
- 进度状态以 `progress/learning-progress.md` 为准
- 不再向仓库根目录继续堆放单日稿、网页导出、`.bak` 文件或平行版本文档
