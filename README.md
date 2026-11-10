# 个人博客站点 (RainHush Blueprint Edition)

基于 [RainHush](https://github.com/usamikinoko/rainhush) 静态站点生成器构建的高颜值工业蓝图风格个人技术博客，视觉与动效参考 [kinoko.fun](https://www.kinoko.fun)。

## ✨ 核心特色

- 📐 **工业蓝图线框美学 (Blueprint & Wireframe)**：网格背景、45° 排线阴影、工程四角十字标记（Wire Marks）与技术图注规范。
- 🌧️ **Canvas 粒子雨幕**：全屏动态雨滴背景，支持右上角雨伞按钮实时开启/关闭与状态记忆。
- 🎲 **3D 等轴测几何方块波动 (Isometric Voxels Wave)**：纯 SVG 实现的九方块平滑正弦波波动动效。
- 📊 **GitHub 风格年度活跃热力图**：52 周发布矩阵，鼠标悬浮显示精准发布日期与文章篇数。
- 🌓 **双主题切换**：深黑模式（`#111111`）与素雅明亮模式（`#fafafa`），带 View Transitions 扩散过渡效果。
- 📝 **Markdown / Obsidian 兼容写作**：支持 Chroma 代码高亮一键复制、Mermaid 图表、结构化图片排版。
- ⚡ **毫秒级极速构建**：Go 语言单一二进制驱动，纯静态零 JS 运行时负担。
- 🚀 **GitHub Actions 自动化流水线**：推送 `main` 分支自动构建并上线至 **GitHub Pages**。

---

## 📁 目录结构

```
my-blog/
├── _config.yaml                  # 站点主配置文件 (站点名、作者、域名、分类、SEO)
├── content/
│   ├── posts/                    # 博客文章 (Markdown 格式)
│   ├── about/                    # 关于页面内容 (支持 about_CN.md 与 about_EN.md 中英双语)
│   ├── friends/                  # 友链列表 (friends.md)
│   └── logs/                     # 站点演进日志 (logs.md)
├── templates/                    # Go HTML 模版
│   ├── layouts/layout.html       # 全局母版 (Head、雨幕 Canvas、Header、Footer)
│   ├── components/               # 独立部件 (Header, Footer, Heatmap, 3D 方块等)
│   └── pages/                    # 路由页面 (index, articles, post, friends, about, logs, 404)
├── static/                       # 静态资源 (打包后的 CSS、JS、字体与图片)
├── styles/                       # SCSS 样式源码 (设计 Token、网格、配色)
├── .github/workflows/deploy.yml  # GitHub Actions 自动化部署流水线
└── Makefile                      # 常用管理命令
```

---

## 🚀 快速上手与日常使用

### 1. 本地快速构建
```bash
make build
# 或者直接执行:
./rainhush build
```
编译产物将生成在 `public/` 目录下。

### 2. 本地开发与实时预览
```bash
make serve
# 或者:
./rainhush test
```
浏览器访问 `http://localhost:8080` 即可实时预览；当修改 Markdown 文章或模版时，站点会自动检测变更并增量重新构建。

### 3. 创建一篇新文章
```bash
make new
# 或者自定义文章英文标识 (slug):
bash scripts/new-post.sh my-cool-project
```
系统会在 `content/posts/` 目录下自动生成带有完整 Frontmatter 元数据的模板，打开即可开始写作。

### 4. 文章 Frontmatter 规范示例
```yaml
---
title: "你的文章标题"
author: "ZiwenYe"
date: "2026-11-10"
updated_at: "2026-11-10"
location: "Hangzhou"
avatar: "/static/imgs/avatar.png"
category: "Tech" # 可选: Tech, Lite Tech, Trivia, Life
---
```

---

## 🌐 部署上线至 GitHub Pages

本项目已经配置了开箱即用的 GitHub Actions 自动化部署流水线 (`.github/workflows/deploy.yml`)。

### 首次部署指引：
1. 在你的 GitHub 账户下创建一个新仓库（例如名为 `blog` 或 `<your-username>.github.io`）。
2. 在本地项目根目录关联远程仓库并推送：
   ```bash
   git init
   git add .
   git commit -m "feat: init rainhush blueprint blog"
   git branch -M main
   git remote add origin https://github.com/<your-username>/<your-repo>.git
   git push -u origin main
   ```
3. 在 GitHub 仓库的 **Settings -> Pages** 设置页面中：
   - 将 **Build and deployment -> Source** 设置为 **GitHub Actions**。
4. 只要你在 `main` 分支提交任何新文章或更新，GitHub Actions 会自动触发构建，并将生成的网站秒级发布上线！
