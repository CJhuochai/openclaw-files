# Day 12/56 - 指针详解

> 学习时长建议：30分钟  
> 学习对象：Java 开发者转 Go

## 今日学习内容

🎯 Day 12/56：指针不再可怕！

今日任务：
1. 指针基本概念
2. 指针与结构体
3. 指针的最佳实践

学习重点：
- Go指针比C简单，没有指针运算
- 指针主要用来修改原值
- 值类型 vs 引用类型

对比理解：
// Go指针
var x int = 10
var p *int = &x  // p指向x
*p = 20          // 通过指针修改x

// 值类型：int, float, bool, struct, array
// 引用类型：slice, map, channel, pointer, function

// struct指针常见用法
type Person struct { name string }
func (p *Person) Rename(newName string) {
    p.name = newName  // 修改原结构体
}

💡 原则：能用值就用值，需要修改原始数据才用指针！

## 打卡模板
- [ ] 完成 3 个任务
- [ ] 记录 1 个 Go vs Java 差异
- [ ] 提交 1 个可运行示例

## 今日复盘（3句话）
1. 我今天最大的收获：
2. 我遇到的阻碍：
3. 我明天的优化动作：
