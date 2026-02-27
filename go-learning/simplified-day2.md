# 📘 Day 2 - Go变量与数据类型 (精简版)

**📅 日期**: 2026-02-28 (明天推送)

## 🎯 今日核心目标
理解Go的变量声明方式，对比Java，掌握基础数据类型

## 🔧 Go变量声明 vs Java

### 1. 短变量声明 (Go独有)
```go
message := "Hello"      // Go - 自动推断类型
name := "陈健"
age := 30
```

```java
String message = "Hello";  // Java - 显式类型声明
String name = "陈健";
int age = 30;
```

### 2. 标准声明 (类似Java但类型在后)
```go
var price float64 = 99.9
var isReady bool = true
```

### 3. 关键差异
| **方面** | **Java** | **Go** | **说明** |
|----------|----------|--------|----------|
| 类型位置 | 类型在前 | 类型在后 | Go的`var price float64` |
| 简洁性 | 相对冗长 | 非常简洁 | Go的`:=`短声明 |
| 类型推断 | 有限 | 强大 | Go能自动推断大多数类型 |
| 不可变 | `final`修饰 | 值类型不可变 | Go更简单直接 |

## 📊 Go数据类型基础

### 基本类型
```go
var age int = 30        // 整数
var price float64 = 99.9 // 浮点数
var name string = "Go"   // 字符串
var isReady bool = true  // 布尔值
```

### 零值概念 (Go独特)
```go
var num int        // 0 (不是null!)
var text string    // "" (空字符串)
var ready bool     // false
```

**Java对比**: Java中未初始化的局部变量会编译错误，Go会给默认零值

## 📝 今日练习

### 练习1: 变量声明转换
将以下Java代码转换为Go:
```java
// Java
String language = "Go";
int version = 1;
boolean isAwesome = true;
```

**Go版本**:
```go
// 你的Go代码
```

### 练习2: 体验零值
```go
var score int
var message string
var isActive bool

fmt.Println("score:", score)
fmt.Println("message:", message)
fmt.Println("isActive:", isActive)
```

## 🔗 完整学习材料
- 📘 GitHub详细版: https://raw.githubusercontent.com/CJhuochai/openclaw-files/main/go-learning/days/day-2-variables.md
- 🌐 Web学习门户: http://43.167.172.248:8789/
- 🎬 对比视频: (如需推荐)

## 💡 给Java开发者的建议
1. **接受类型在后** - 习惯`var price float64`格式
2. **利用短声明** - `:=`是Go的优势，多用
3. **理解零值** - 这对Go的错误处理很重要
4. **一步步来** - 第一天理解基础就好

---
*陈皮AI助手为你准备，基于真实Java开发者需求*
