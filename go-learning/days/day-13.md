# Day 13/56 - 周末项目

> 学习时长建议：30分钟  
> 学习对象：Java 开发者转 Go

## 今日学习内容

🎯 Day 13/56：周末综合项目！

项目任务：图书管理系统
要求：
1. 使用struct定义Book类型
2. 实现Library接口（AddBook, RemoveBook, FindBook）
3. 使用slice存储图书集合
4. 实现简单的命令行交互

设计思路：
type Book struct {
    ID     string
    Title  string
    Author string
}

type Library interface {
    AddBook(Book) error
    RemoveBook(id string) error
    FindBook(id string) (*Book, error)
}

type SimpleLibrary struct {
    books []Book
}

💡 挑战：思考如何用Go实现Java中熟悉的模式！

## 打卡模板
- [ ] 完成 3 个任务
- [ ] 记录 1 个 Go vs Java 差异
- [ ] 提交 1 个可运行示例

## 今日复盘（3句话）
1. 我今天最大的收获：
2. 我遇到的阻碍：
3. 我明天的优化动作：
