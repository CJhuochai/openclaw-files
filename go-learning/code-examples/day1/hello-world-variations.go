// 第一天代码示例 - Hello World变体
package main

import (
    "fmt"
    "os"
)

// 基础版本
func basicHello() {
    fmt.Println("Hello, World!")
}

// 带名字版本
func helloWithName(name string) {
    fmt.Printf("Hello, %s!\n", name)
}

// 多语言问候
func multiLangHello() {
    greetings := []string{
        "Hello!",
        "你好!",
        "¡Hola!",
        "Bonjour!",
        "こんにちは!",
    }
    for _, greeting := range greetings {
        fmt.Println(greeting)
    }
}

// 从Java转来的对比示例
func javaVsGoComparison() {
    fmt.Println("=== Java vs Go 语法对比 ===")
    fmt.Println()
    fmt.Println("Java变量声明:")
    fmt.Println("String message = \"Hello\";")
    fmt.Println("int count = 10;")
    fmt.Println()
    fmt.Println("Go变量声明:")
    fmt.Println("message := \"Hello\"")
    fmt.Println("count := 10")
}

// 命令行参数版本
func helloWithArgs() {
    if len(os.Args) > 1 {
        fmt.Printf("Hello, %s!\n", os.Args[1])
    } else {
        fmt.Println("Hello, 陌生人!")
    }
}

func main() {
    fmt.Println("=== Day 1 代码示例合集 ===")
    fmt.Println()
    
    basicHello()
    fmt.Println()
    
    helloWithName("CJhuochai")
    fmt.Println()
    
    fmt.Println("多语言问候:")
    multiLangHello()
    fmt.Println()
    
    javaVsGoComparison()
    fmt.Println()
    
    fmt.Println("命令行参数测试:")
    helloWithArgs()
}
