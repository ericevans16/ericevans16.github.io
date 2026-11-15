---
title: "站点上线：基于 Rainhush 与工业蓝图美学的博客新起点"
author: "ZiwenYe"
date: "2026-11-10"
updated_at: "2026-11-10"
location: "Hangzhou"
avatar: "/static/imgs/avatar.png"
category: "Tech"
tags: ["Go", "Static Site", "Blueprint"]
---

今天，我的个人独立博客站点正式上线了！

在尝试过各大中心化博客平台与若干庞大的前端框架之后，我一直在寻找一种能兼具**极致工程美感**、**纯粹阅读体验**与**极速静态编译**的博客形态。直到遇见了 [Rainhush](https://github.com/usamikinoko/rainhush) 与 [kinoko.fun](https://www.kinoko.fun) 的工业线框蓝图设计风格。

## 为什么选择这套设计？

这套博客设计有几个非常击中极客审美的特质：

1. **工业图纸与线框美学 (Blueprint & Wireframe)**：
   网格背景、45 度排线阴影（Hatching）、四角工程测量标记（Wire marks）与技术图注（`Fig. 1. Overview`），让整个站点呈现出精密仪器的科技质感。
2. **轻量灵动的动效系统**：
   - 全屏雨幕粒子模拟（右上角支持一键启闭并保存偏好）。
   - 纯 SVG 实现的 3D 等轴测九方块正弦波波动。
   - 现代浏览器的 View Transitions 双主题扩散切换。
3. **极速单二进制静态编译**：
   后端由 Go 语言驱动，毫秒级扫描 Markdown 并输出纯静态 HTML/CSS/JS，完全零 JS 运行时负担。

```go
// Rainhush 核心构建逻辑简要示意
func BuildSite(postsDir string) error {
    posts, err := loadPosts(postsDir)
    if err != nil {
        return err
    }
    // 极速静态渲染并生成全站
    return renderAll(posts)
}
```

## 写作与后续规划

未来我将在这里持续分享以下内容：
- **AI Agent 系统研发与实践**：原理解析、任务调度与工程落地。
- **现代化架构与全栈技术**：Go、TypeScript 与高性能服务开发。
- **个人思考与生活纪实**：阅读札记、工具评测与随笔。

愿在此空间，与诸位共同探索技术与生活之美！
