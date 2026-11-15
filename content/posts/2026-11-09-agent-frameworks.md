---
title: "Agent 开发学习：不借助框架实现网页定向信息采集 Agent"
author: "ZiwenYe"
date: "2026-11-09"
updated_at: "2026-11-09"
location: "Hangzhou"
avatar: "/static/imgs/avatar.png"
category: "Tech"
tags: ["AI Agent", "LLM", "Python"]
---

在接触复杂的 AI Agent 框架（如 LangChain、AutoGPT、CrewAI）之前，很多初学者常常被框架中层层嵌套的抽象类和复杂回调绕晕。其实，Agent 的核心本质并不神秘，甚至只需要几十行核心代码即可跑起一个极简的 ReAct 循环。

本文以构建一个**自动网页搜索 + 定向信息采集 Agent** 为例，拆解其运行闭环。

## Agent 的底层运行闭环

一个标准的智能体通常由三个要素构成：
1. **Model（思考中枢）**：负责分析当前上下文并决定下一步行动。
2. **Tools（行动工具箱）**：如网络搜索、页面抓取、文件读写等可调用函数。
3. **Loop（主驱动循环）**：驱动“思考 -> 调用工具 -> 接收观察结果 -> 再次思考”的状态机。

```typescript
// 简化的 Agent Loop 核心逻辑
async function runAgent(prompt: string, tools: ToolRegistry) {
    let history: Message[] = [{ role: "user", content: prompt }];
    
    while (true) {
        const response = await llm.chat({ messages: history, tools: tools.schemas });
        if (response.toolCalls.length === 0) {
            // 没有工具调用，输出最终回答
            return response.content;
        }
        
        for (const call of response.toolCalls) {
            const toolResult = await tools.execute(call.name, call.args);
            history.push({ role: "tool", toolCallId: call.id, content: toolResult });
        }
    }
}
```

## 动手实践的心得

自己手搓原生 Agent Loop 的最大好处是：
- **没有框架黑盒**：每一条 Message 的流转、每一个 Tool Call 的参数序列化都尽在掌控之中。
- **调试直观**：异常或死循环能够直接打断点排查。
- **按需扩展**：可以自由融入上下文压缩算法（Context Compression）和动态工具剪枝。
