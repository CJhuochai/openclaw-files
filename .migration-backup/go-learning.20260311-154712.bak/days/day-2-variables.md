# 📘 Day 2 - Go变量与数据类型 (详细版)

## 1. Go变量声明语法详解

### 1.1 短变量声明 (:=)
```go
// 自动类型推断
message := "Hello, Go!"      // string
count := 42                  // int  
price := 99.99              // float64
isReady := true             // bool
```

**Java对比:**
```java
String message = "Hello, Java!";
int count = 42;
double price = 99.99;
boolean isReady = true;
```

### 1.2 标准变量声明 (var)
```go
var username string = "陈健"    // 显式类型
var age int = 30              // 标准格式
var score float64             // 仅声明，使用零值
```

**关键特性:**
- 类型在变量名后 (`var name string`)
- 可以使用零值（自动初始化）
- 可声明多个变量: `var a, b, c int`

### 1.3 零值概念 (Zero Values)
```go
var num int          // 0 (不是null!)
var text string      // "" (空字符串)
var isActive bool    // false
var ptr *int         // nil
```

**Java开发者须知:**
- Go中**没有null概念**（指针除外）
- 所有变量都有默认值
- 这影响错误处理和安全性设计

## 2. 数据类型系统

### 2.1 基本类型对比表
| **类型** | **Go示例** | **Java对应** | **零值** | **说明** |
|----------|------------|-------------|----------|----------|
| 整数 | `var age int = 30` | `int` | `0` | 32/64位自动选择 |
| 浮点数 | `var price float64 = 99.9` | `double` | `0.0` | 双精度 |
| 布尔 | `var isReady bool = true` | `boolean` | `false` | true/false |
| 字符串 | `var name string = "Go"` | `String` | `""` | UTF-8编码 |

### 2.2 类型转换
```go
// 显式转换（必须）
var intValue int = 42
var floatValue float64 = float64(intValue)

// Go vs Java对比
// Go: 必须显式转换（类型安全）
// Java: 部分自动转换，部分需要cast
```

## 3. Java开发者特别关注点

### 3.1 变量声明位置
```java
// Java: 类型在前
String message = "Hello";
List<String> names = new ArrayList<>();
```

```go
// Go: 类型在后
message := "Hello"
names := []string{}  // 切片，类似ArrayList
```

### 3.2 作用域规则
```go
// Go: 简洁的作用域规则
if x := calculate(); x > 0 {
    fmt.Println(x)  // x在此可用
}
// x在这里不可用（超出作用域）

// Java: 更传统的作用域规则
```

### 3.3 不可变性的差异
```java
// Java: final关键字
final String name = "Java";
```
```go
// Go: 值不可变性（自然特性）
const version = 1.0
```

## 4. 实践练习

### 练习1: 转换Java代码
```java
// Java版本
public class Example {
    public static void main(String[] args) {
        String language = "Go";
        int version = 1;
        boolean isCool = true;
        double rating = 9.5;
        
        System.out.println(language + " " + version);
    }
}
```

**转换为Go:**
```go
// 你的Go版本代码...

```

### 练习2: 理解零值
```go
package main

import "fmt"

func main() {
    // 体验Go的零值
    var (
        score int
        name string
        data []int
        ptr *int
    )
    
    fmt.Printf("score: %v (类型: %T)\n", score, score)
    fmt.Printf("name: '%v' (类型: %T)\n", name, name)
    fmt.Printf("data: %v (类型: %T)\n", data, data)
    fmt.Printf("ptr: %v (类型: %T)\n", ptr, ptr)
}
```

## 5. 常见误区

### 误区1: 误用nil
```go
// ❌ 错误: 对非指针类型使用nil
var str string = nil  // 编译错误

// ✅ 正确: 使用零值
var str string       // 自动为""
```

### 误区2: 以为:=能重复声明
```go
// ❌ 错误
x := 10
x := 20  // 重复声明错误

// ✅ 正确
x := 10
x = 20   // 重新赋值
```

### 误区3: 对Java式类型系统期望
- Go没有类继承，是组合优先
- 接口是隐式实现（不需要显式声明）
- 没有泛型（直到Go 1.18）

## 6. 学习建议

### 第一天 (今天):
- ✅ 理解Go变量声明语法
- ✅ 体验零值概念
- ✅ 完成简单Java→Go转换

### 第二天 (明天):
- 理解控制流程if/for
- 学习函数声明
- 体验Go的错误处理

### 第一周目标:
- 能用Go写简单程序
- 理解与Java的主要差异
- 形成Go的思维方式

## 7. 扩展阅读

### 技术文档:
- [Go语言规范](https://golang.org/ref/spec)
- [Effective Go](https://golang.org/doc/effective_go)

### 对比资源:
- [Go for Java Programmers](https://golang.org/doc/effective_go.html)

### 工具推荐:
- VS Code + Go扩展（最佳入门体验）
- GoLand（功能最全，有试用期）

---

**文档版本**: 1.0  
**更新时间**: 2026-02-28  
**针对用户**: 陈健 (Java开发背景)  
**文档创建**: 陈皮AI助手  
**下次更新**: 2026-03-01 (添加更多Java对比示例)
