# Day 28 详细学习文档 - 第四周总结

## 1. 今日学习目标
- 完成本阶段知识归纳，形成可复用笔记模板
- 以 Java 开发经验为锚点，明确 Go 的设计取舍
- 输出一份可运行代码与一份阶段复盘

## 2. 核心概念详解（面向Java开发者）
本日主题属于 **错误处理与测试** 的里程碑节点。你要做到的不只是“会写”，而是理解为什么 Go 这么设计。

- 在 Java 中你通常依赖：**try/catch + JUnit**
- 在 Go 中更推荐：**error 链 + table-driven tests**
- 迁移原则：先保证可运行，再优化抽象层次，避免把 Java 模式原封不动搬到 Go。

## 3. Go vs Java 深度对比
| 维度 | Go | Java | 迁移建议 |
|---|---|---|---|
| 代码风格 | 简洁、函数粒度小 | 类与注解较多 | 优先写小函数 + 明确边界 |
| 错误处理 | 显式返回 `error` | 异常传播 | 在边界统一包装错误上下文 |
| 并发模型 | goroutine/channel | 线程池/锁 | IO 任务优先 channel，共享状态再加锁 |
| 构建部署 | 静态编译二进制 | 依赖 JVM 运行时 | 服务侧优先采用二进制 + 容器 |

## 4. 代码示例（可运行）
### 示例1：阶段总结输出
```go
package main

import "fmt"

func main() {
    fmt.Println("Day 28 milestone: 第四周总结")
}
```

### 示例2：错误包装 + 可观测日志
```go
package main

import (
    "errors"
    "fmt"
)

func load(topic string) (string, error) {
    if topic == "" {
        return "", errors.New("topic is empty")
    }
    return "loaded:" + topic, nil
}

func main() {
    out, err := load("day-28")
    if err != nil {
        fmt.Printf("[ERROR] %v\n", err)
        return
    }
    fmt.Printf("[INFO] %s\n", out)
}
```

## 5. 常见坑与排错
1. **只记语法，不做迁移对比** → 每日记录 1 条 Go vs Java 决策差异。  
2. **错误处理缺上下文** → 使用 `fmt.Errorf("...: %w", err)` 包装链路。  
3. **并发示例可跑但不安全** → 打开 `-race` 检查竞态。

## 6. 练习任务
### 基础
- 写一段 50 行内总结代码，覆盖今日核心点
- 增加 1 个失败路径并打印可诊断日志

### 进阶
- 以你熟悉的 Java 小模块为蓝本，写一个 Go 等价实现
- 提交前运行：`go test ./...` 与 `go test -race ./...`

## 7. 当日小项目任务
- 产出 `summary-day-28.md`：包含“学到的/踩坑/下一步”
- 对现有代码做一次最小重构：减少重复、增强可测试性

## 8. 验收标准
- [ ] 能解释本阶段关键取舍（不是只会写）
- [ ] 示例代码可运行且有错误路径
- [ ] 能说清 Go 方案比 Java 方案在本场景的收益

## 9. 打卡模板
- 今日完成：
- 今日卡点：
- 明日优化：
