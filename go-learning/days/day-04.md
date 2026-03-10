# Day 4/56 - 函数基础

> 学习时长建议：30分钟  
> 学习对象：Java 开发者转 Go

## 今日学习内容

🎯 Day 4/56：函数大变身！

今日任务：
1. 函数的定义与调用
2. 多返回值特性
3. 命名返回值

学习重点：
- Go函数支持多返回值（Java不支持）
- 命名返回值使代码更清晰
- 函数作为一等公民

对比练习：
// Java单返回值
public int add(int a, int b) { return a + b; }

// Go多返回值
func add(a, b int) (int, error) {
    return a + b, nil
}

// Go命名返回值
func divide(a, b float64) (result float64, err error) {
    if b == 0 {
        err = errors.New("除零错误")
        return
    }
    result = a / b
    return
}

💡 优势：错误处理更优雅！

## 打卡模板
- [ ] 完成 3 个任务
- [ ] 记录 1 个 Go vs Java 差异
- [ ] 提交 1 个可运行示例

## 今日复盘（3句话）
1. 我今天最大的收获：
2. 我遇到的阻碍：
3. 我明天的优化动作：
