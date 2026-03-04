# Go语言学习 - Day 38/56 ⚡

## 今日主题: 并发编程 - select语句
**核心概念**: 多路复用通道

## 🎯 学习目标
✅ 理解Go并发模型的核心思想
✅ 掌握Java线程 vs Go goroutine的差异
✅ 编写安全的并发代码
✅ 避免常见的并发陷阱

## 💡 Java vs Go 并发对比
| 方面 | Java | Go |
|------|------|----|
| **并发单元** | 线程(Thread) + 线程池 | goroutine + channel |
| **内存开销** | 1MB左右/线程 | 2KB左右/goroutine |
| **调度方式** | OS线程调度 | Go runtime调度（M:N模型） |
| **同步机制** | synchronized, Lock | channel, sync包 |
| **编程复杂度** | 较高（需要显式管理线程） | 较低（goroutine轻量） |

## 📚 详细学习内容

### 1. 基础概念
- goroutine的创建和销毁
- 并发 vs 并行的区别
- Go scheduler工作原理

### 2. 代码示例
```go
package main

import (
    "fmt"
    "time"
)

func worker(id int, jobs <-chan int, results chan<- int) {
    for job := range jobs {
        fmt.Printf("Worker %d processing job %d\n", id, job)
        time.Sleep(time.Second) // 模拟工作
        results <- job * 2
    }
}

func main() {
    jobs := make(chan int, 100)
    results := make(chan int, 100)
    
    // 启动3个worker
    for w := 1; w <= 3; w++ {
        go worker(w, jobs, results)
    }
    
    // 发送工作
    for j := 1; j <= 5; j++ {
        jobs <- j
    }
    close(jobs)
    
    // 收集结果
    for a := 1; a <= 5; a++ {
        result := <-results
        fmt.Printf("Result: %d\n", result)
    }
}
```

### 3. 常见问题和解决方案
| 问题 | 解决方案 |
|------|----------|
| 数据竞争 | 使用sync.Mutex或channel保护 |
| goroutine泄漏 | 使用context控制生命周期 |
| 死锁 | 避免循环等待，使用超时机制 |

## 🧪 实践练习

### 练习1: 基础并发
编写一个程序，创建10个goroutine，每个goroutine打印自己的编号并延迟不同时间。

### 练习2: 并发求和
使用多个goroutine并发计算1-1000的和，对比单线程性能。

### 练习3: 并发Web请求
并发获取多个URL的内容，收集结果。

## ⚠️ 并发安全注意事项
1. **数据竞争**: 使用channel或sync包保护共享数据
2. **内存泄漏**: goroutine必须正确结束
3. **性能优化**: 合理控制goroutine数量

## 📊 性能对比测试
- **Go goroutine**: 可轻松创建数千个并发单元
- **Java线程**: 通常限制在数百到数千个
- **上下文切换**: Go runtime调度更高效

## 💪 学习难度评估
- ⭐⭐⭐⭐☆ 难度较高（需要认真理解）
- ⏰ 建议学习时间: 60-75分钟
- 🔧 代码量: 150-300行

## 🔍 进阶学习路径
- Go并发模式（fan-out, fan-in）
- sync包高级用法
- context包深入学习
- 并发数据结构和算法

## 📈 适用场景
- 高并发Web服务器
- 数据处理流水线
- 实时通信系统
- 爬虫和多任务处理

---

**创建时间**: 2026-03-03 00:16:50
**版本**: v3.0 (并发专题)
**Java开发者特别注意**: Go的并发模型与Java有本质区别，避免用Java思维编写Go并发代码。
