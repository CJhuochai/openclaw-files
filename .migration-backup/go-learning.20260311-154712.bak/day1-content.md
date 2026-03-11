# 🎯 Day 1/56：迈出Go第一步！

**推送时间：** 2026-03-10 07:00（上海时间）

## 今日任务
1. 安装Go 1.22+ (https://golang.org/dl/)
2. 配置环境变量
3. 写下第一个Go程序

## 学习重点
- 理解GOROOT和GOPATH的区别
- 配置Go Modules（现代项目标准）
- Hello World的Go vs Java写法对比

## 对比学习
**Java版本：**
```java
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

**Go版本：**
```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
```

## 💡 阳光提醒
- 安装顺利吗？有问题随时问我！
- Go的语法更简洁，不需要分号结尾
- 第一行必须是package main
- main函数是程序的入口点

## 🛠️ 安装步骤
1. 访问 https://golang.org/dl/
2. 下载对应系统的安装包
3. 运行安装程序
4. 配置环境变量：
   - Linux: export PATH=$PATH:/usr/local/go/bin
   - 添加到 ~/.bashrc 或 ~/.zshrc

## 📝 练习任务
1. 创建 hello.go 文件
2. 写入上面的Go代码
3. 运行：go run hello.go
4. 确认输出 "Hello, World!"

---
**陈皮陪伴：** 今天是Go学习的第一天，迈出这步，你已经成功了一半！🚀
