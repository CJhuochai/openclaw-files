# Day 5/56 - 包管理入门

> 学习时长建议：30分钟  
> 学习对象：Java 开发者转 Go

## 今日学习内容

🎯 Day 5/56：包的秘密！

今日任务：
1. 理解包的概念
2. 导入包的不同方式
3. 可见性规则（大小写）

学习重点：
- 包是Go的基本组织单位
- 首字母大小写决定是否导出
- Go Modules vs Maven

代码示例：
// 导包方式
import "fmt"                    // 标准方式
import m "math"                // 别名
import . "strings"             // 直接使用（慎用）
import _ "database/sql"        // 只执行init

// 可见性规则
var privateVar int   // 小写，包内可见
var PublicVar int    // 大写，可导出

💡 重要：Go没有public/private关键字！

## 打卡模板
- [ ] 完成 3 个任务
- [ ] 记录 1 个 Go vs Java 差异
- [ ] 提交 1 个可运行示例

## 今日复盘（3句话）
1. 我今天最大的收获：
2. 我遇到的阻碍：
3. 我明天的优化动作：
