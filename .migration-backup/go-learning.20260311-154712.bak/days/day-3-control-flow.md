# 📘 Day 3 - Go控制流程（对比Java）

**📅 日期**: 2026-02-29  
**👤 用户**: 陈健 (Java开发背景)  
**⏱️ 预计时间**: 30分钟  
**🎯 目标**: 理解Go的基础控制语句，对比Java的主要差异

---

## 1. if/else 语句

### Go语法 (简洁型)
```go
// 基础if
if score > 90 {
    fmt.Println("优秀")
}

// if-else (注意: 没有括号)
if age >= 18 {
    fmt.Println("Adult")
} else {
    fmt.Println("Minor")
}

// 条件之前可以执行简单语句
if result := calculate(); result > 0 {
    fmt.Println("Positive:", result)
}
```

### Java语法 (传统型)
```java
// 基础if (必须有括号)
if (score > 90) {
    System.out.println("优秀");
}

// if-else
if (age >= 18) {
    System.out.println("Adult");
} else {
    System.out.println("Minor");
}

// Java不能在if条件中执行声明+赋值组合
int result = calculate();
if (result > 0) {
    System.out.println("Positive: " + result);
}
```

---

## 2. for循环 (Go只有这一种)

### Go的for循环
```go
// 1. 传统C风格for
for i := 0; i < 5; i++ {
    fmt.Println(i)
}

// 2. 类似while的for
count := 0
for count < 5 {
    fmt.Println(count)
    count++
}

// 3. 无限循环
for {
    // 需要break退出
}

// 4. range遍历 (最常用)
names := []string{"Go", "Java", "Python"}
for i, name := range names {
    fmt.Printf("%d: %s\n", i, name)
}
```

### Java的循环选项
```java
// 1. for循环 (必须括号)
for (int i = 0; i < 5; i++) {
    System.out.println(i);
}

// 2. while循环
int count = 0;
while (count < 5) {
    System.out.println(count);
    count++;
}

// 3. do-while循环
int num = 0;
do {
    System.out.println(num);
    num++;
} while (num < 5);

// 4. for-each遍历
String[] names = {"Go", "Java", "Python"};
for (String name : names) {
    System.out.println(name);
}
```

**关键差异：Go没有while关键字！** 用`for`代替所有循环需求。

---

## 3. switch语句

### Go的switch (更安全简洁)
```go
fruit := "apple"

switch fruit {
case "apple":
    fmt.Println("🍎 Apple")
case "banana":
    fmt.Println("🍌 Banana")
default:
    fmt.Println("Unknown fruit")
}

// switch不需要break (自动break)
score := 85
switch {
case score >= 90:
    fmt.Println("A")
case score >= 80:
    fmt.Println("B")  // 执行这个，不会fallthrough到C
case score >= 70:
    fmt.Println("C")
}

// 如果需要继续执行，用fallthrough
day := "Monday"
switch day {
case "Monday":
    fmt.Println("Start of week")
    fallthrough  // 继续执行Tuesday
case "Tuesday":
    fmt.Println("Second day")
}
```

### Java的switch (需要break)
```java
String fruit = "apple";

switch (fruit) {
    case "apple":
        System.out.println("🍎 Apple");
        break;  // 必须break，否则会"贯穿"
    case "banana":
        System.out.println("🍌 Banana");
        break;
    default:
        System.out.println("Unknown fruit");
}
```

**关键差异：Go switch不需要break，更安全；Java忘记break会有bug风险。**

---

## 4. 核心对比总结表

| **控制结构** | **Go语法** | **Java语法** | **主要差异** | **给Java开发者的建议** |
|-------------|------------|-------------|-------------|-------------------|
| **if语句** | `if score > 90 { ... }` | `if (score > 90) { ... }` | Go没有括号 | 习惯省略括号 |
| **else** | 相同但格式要求 | 相同 | 大括号位置严格 | 保持一致格式 |
| **for循环** | 只有`for`一种 | `for`/`while`/`do-while` | Go统一用`for` | 用`for`替代所有while |
| **无限循环** | `for { ... }` | `while (true) { ... }` | 语法差异 | 习惯简洁的`for {}` |
| **遍历** | `range` | `for-each` | 语法不同但概念相似 | `range`是Go的利器 |
| **switch** | 自动break | 需要手动break | 更安全的设计 | 不用担心fallthrough bug |
| **条件变量** | `if x := f(); x > 0 {}` | 不支持 | Go允许声明+判断 | 利用Go的简洁特性 |

---

## 5. 练习任务

### 练习1：将Java循环转为Go
```java
// Java版 - 统计大于60分的成绩
int[] scores = {85, 42, 78, 90, 55};
int pass = 0;
for (int i = 0; i < scores.length; i++) {
    if (scores[i] >= 60) {
        pass++;
    }
}
System.out.println("及格人数: " + pass);
```

**转为Go**:
```go
// 你的答案：
```

### 练习2：Go特有的range遍历
```go
// 体验Go的range
students := []string{"Alice", "Bob", "Charlie"}
ages := []int{20, 22, 19}

// 同时遍历两个切片
```

### 练习3：switch对比体验
```go
// 用Go switch重写Java的多重if
grade := "B"
// Java写法: if (grade == "A") else if (grade == "B") else if...
// Go更优写法: switch
```

---

## 6. 常见误区

### ❌ 误区1：在Go中寻找while
```go
// ❌ 错误: Go没有while关键字
while count < 10 {
    // 编译错误
}

// ✅ 正确: 用for代替while
for count < 10 {
    // 正确
}
```

### ❌ 误区2：忘记Go switch不需要break
```go
// ❌ 不必要的break (可编译，但多余)
switch x {
case 1:
    fmt.Println("One")
    break  // 不需要
case 2:
    fmt.Println("Two")
}
```

### ✅ 正确：利用Go的简洁特性
```go
// ✅ 良好实践
if age := getUserAge(); age > 0 {
    fmt.Println(age)  // age在此作用域
}
// age在这里不可访问 - 作用域限制
```

---

## 7. 学习建议

### 今天的目标（适度）：
1. ✅ 识别Go的三种for循环形式
2. ✅ 理解Go switch比Java更安全的设计
3. ✅ 习惯省略if语句的括号
4. ✅ 尝试用`range`遍历集合

### 不要追求（今天）：
1. ❌ 记忆所有语法细节
2. ❌ 写出"地道"的Go代码
3. ❌ 理解Go的所有控制流特性

---

## 8. 资源链接

### 扩展阅读
- [Go控制语句官方文档](https://golang.org/ref/spec#Control_flow)
- [Effective Go - 控制流](https://golang.org/doc/effective_go.html#control_flow)

### 代码示例
- 目录: `code-examples/day3/`
- 文件: `control-flow-practice.go`

### 明日预告（Day 4）
- 主题: Go函数定义 vs Java方法
- 重点: 多返回值、命名返回值、错误处理

---

**文档版本**: v1.0  
**创建时间**: 2026-02-28 17:09  
**针对用户**: 陈健 (Java开发背景)
