# 学习目录索引

## 已创建的学习内容
$(find "$DAYS_DIR" -name "day-*.md" 2>/dev/null | sort | while read file; do
    day_number=$(basename "$file" | sed 's/day-//; s/\.md//')
    echo "- [Day $day_number]($(basename "$file")) - $(head -3 "$file" 2>/dev/null | grep "## 今日主题" | sed 's/## 今日主题: //' || echo "Go语言学习")"
done)

## 学习进度
- **总天数**: 56天
- **已创建**: $NEW_COUNT天
- **完成进度**: $((NEW_COUNT * 100 / 56))%
- **最后更新**: $(date '+%Y-%m-%d %H:%M:%S')

## 建议学习顺序
1. 按照Day 1-56的顺序学习
2. 每个文件30-60分钟
3. 完成所有代码示例
4. 对比Java实现差异

**学习愉快！** 📚
