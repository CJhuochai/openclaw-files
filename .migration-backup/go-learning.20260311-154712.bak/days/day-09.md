# Day 9/56 - 方法定义

> 学习时长建议：30分钟  
> 学习对象：Java 开发者转 Go

## 今日学习内容

🎯 Day 9/56：给struct添加行为！

今日任务：
1. 方法的定义
2. 值接收者 vs 指针接收者
3. 方法集的概念

学习重点：
- 方法是在类型上定义的函数
- 接收者类型决定方法行为
- 指针接收者可以修改原值

代码示例：
type Circle struct {
    radius float64
}

// 值接收者（不修改原值）
func (c Circle) Area() float64 {
    return math.Pi * c.radius * c.radius
}

// 指针接收者（可修改原值）
func (c *Circle) SetRadius(r float64) {
    c.radius = r
}

// 使用
c := Circle{radius: 5}
area := c.Area()      // 调用值接收者方法
c.SetRadius(10)       // 调用指针接收者方法

💡 选择指南：需要修改原值？用指针接收者！


## 深入学习入口
📘 详细学习文档：`go-learning/docs/day-09-detail.md`

## 打卡模板
- [ ] 完成 3 个任务
- [ ] 记录 1 个 Go vs Java 差异
- [ ] 提交 1 个可运行示例

## 今日复盘（3句话）
1. 我今天最大的收获：
2. 我遇到的阻碍：
3. 我明天的优化动作：
