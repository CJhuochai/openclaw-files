# Day 11/56 - 接口高级用法

> 学习时长建议：30分钟  
> 学习对象：Java 开发者转 Go

## 今日学习内容

🎯 Day 11/56：接口深入探索！

今日任务：
1. 接口组合
2. 类型断言
3. 类型判断

学习重点：
- 接口可以组合（类似多重继承）
- 类型断言检查接口值的具体类型
- 类型判断更安全的类型检查

代码示例：
// 接口组合
type Reader interface { Read() }
type Writer interface { Write() }
type ReadWriter interface {
    Reader
    Writer
}

// 类型断言
var i interface{} = "hello"
s := i.(string)        // 断言为string
fmt.Println(s)         // hello

// 安全的类型判断
if s, ok := i.(string); ok {
    fmt.Println("是字符串:", s)
} else {
    fmt.Println("不是字符串")
}

💡 实用技巧：多使用类型判断，避免panic！

## 打卡模板
- [ ] 完成 3 个任务
- [ ] 记录 1 个 Go vs Java 差异
- [ ] 提交 1 个可运行示例

## 今日复盘（3句话）
1. 我今天最大的收获：
2. 我遇到的阻碍：
3. 我明天的优化动作：
