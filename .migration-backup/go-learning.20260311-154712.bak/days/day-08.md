# Day 8/56 - struct基础

> 学习时长建议：30分钟  
> 学习对象：Java 开发者转 Go

## 今日学习内容

🎯 Day 8/56：struct登场！

今日任务：
1. struct的定义与使用
2. 结构体字段访问
3. 结构体的初始化

学习重点：
- struct是Go的数据结构核心
- 没有class，但struct更灵活
- 组合替代继承

对比示例：
// Java类
public class Person {
    private String name;
    private int age;
    // getter/setter
}

// Go结构体
type Person struct {
    name string  // 小写，私有
    Age  int     // 大写，公开
}

// 初始化
p1 := Person{"张三", 25}
p2 := Person{name: "李四", Age: 30}
p3 := Person{name: "王五"} // Age为零值

💡 思维转变：从“是什么”到“有什么”！


## 深入学习入口
📘 详细学习文档：`go-learning/docs/day-08-detail.md`

## 打卡模板
- [ ] 完成 3 个任务
- [ ] 记录 1 个 Go vs Java 差异
- [ ] 提交 1 个可运行示例

## 今日复盘（3句话）
1. 我今天最大的收获：
2. 我遇到的阻碍：
3. 我明天的优化动作：
