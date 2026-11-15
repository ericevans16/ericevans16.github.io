# ZiwenYe 的个人博客

基于 [sitemaker](https://github.com/ericevans16/sitemaker) 静态站点生成器构建的工业蓝图风格个人博客，托管于 [ericevans16.github.io](https://ericevans16.github.io)。

## 📁 仓库结构

本仓库仅保留**站点配置、文章内容与静态资源**，构建内核与内置 `blueprint` 主题均由独立仓库 [`ericevans16/sitemaker`](https://github.com/ericevans16/sitemaker) 提供：

```text
.
├── _config.yaml                  # 站点配置（导航菜单、分类、链接规则、插件开关）
├── content/
│   ├── posts/                    # 博客文章 (Markdown)
│   ├── about/                    # 关于页面（about_CN.md / about_EN.md）
│   ├── friends/                  # 友链列表 (friends.md)
│   └── logs/                     # 站点演进日志 (logs.md)
├── static/
│   └── imgs/                     # 站点图片与头像
├── .github/workflows/deploy.yml  # GitHub Actions 自动拉取 sitemaker 并部署 Pages
└── Makefile                      # 常用管理命令
```

> 如需在当前站点覆盖主题模版或追加自定义样式，只需在根目录新建 `layouts/` 或 `static/css/*.css`，`sitemaker` 会在构建时自动合并覆盖。

## 🚀 日常写作与预览

```bash
# 安装或更新 sitemaker CLI
make install

# 本地实时预览（http://localhost:8080，带文件监听与浏览器自动刷新）
make serve

# 创建一篇新文章
make new SLUG=my-new-post

# 查看所有文章及状态
make list

# 构建静态文件到 public/
make build
```
