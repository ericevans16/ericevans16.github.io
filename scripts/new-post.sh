#!/usr/bin/env bash
set -e

DATE=$(date +"%Y-%m-%d")
SLUG=${1:-"new-post"}
FILE="content/posts/${DATE}-${SLUG}.md"

if [ -f "$FILE" ]; then
    echo "Error: $FILE already exists!"
    exit 1
fi

cat <<EOF > "$FILE"
---
title: "新文章标题"
author: "ZiwenYe"
date: "${DATE}"
updated_at: "${DATE}"
location: "Hangzhou"
avatar: "/static/imgs/avatar.png"
category: "Tech"
---

这里开始撰写你的文章正文...

## 第一小节

正文内容...
EOF

echo "Created new post: $FILE"
