# Day 10/56 - 接口入门

> 学习时长建议：30分钟  
> 学习对象：Java 开发者转 Go

## 今日学习内容

🎯 Day 10/56：接口的魔力！

今日任务：
1. 接口的定义
2. 接口的隐式实现
3. 空接口interface{}

学习重点：
- Go接口是隐式实现的（不需要implements）
- 接口定义行为，不定义数据
- interface{}是万能类型

对比示例：
// Java显式实现
public class Dog implements Animal {
    public void makeSound() { System.out.println("Woof"); }
}

// Go隐式实现
type Animal interface {
    MakeSound()
}

type Dog struct{}
func (d Dog) MakeSound() {
    fmt.Println("Woof")
}

// 使用
var a Animal = Dog{}
a.MakeSound()

💡 设计哲学：“鸭子类型”：看起来像鸭子，叫起来像鸭子，那就是鸭子！


## 深入学习入口
📘 详细学习文档：`go-learning/docs/day-10-detail.md`

## 打卡模板
- [ ] 完成 3 个任务
- [ ] 记录 1 个 Go vs Java 差异
- [ ] 提交 1 个可运行示例

## 今日复盘（3句话）
1. 我今天最大的收获：
2. 我遇到的阻碍：
3. 我明天的优化动作：
