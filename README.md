# 🫧 透明百业 · Transparent Studio

燕云十六声游戏百业社团 Web App

## ✨ 功能

- **登录系统** — 昵称登录，自动注册，无需密码
- **四主题换色** — 🌸樱花 / 🎋竹林 / 🌅暮色 / 🌙月夜
- **每日打卡** — 早起·晚睡·💩，日历展示，本周排行榜
- **食物扭蛋机** — 167+种食物，tag加权随机筛选，用户可添加
- **双十报名** — 副本场次管理，指挥位+9人自助报名，管理员密码保护

## 🛠️ 技术栈

- 前端：单HTML文件，原生JS，Zpix中文像素字体
- 后端：Supabase (PostgreSQL + REST API)
- 部署：FastAPI 静态文件服务 + Cloudflare Tunnel
- 风格：萌系像素风 🫧

## 📦 部署

1. 在 [Supabase](https://supabase.com) 创建项目
2. 执行 `schema.sql` 创建数据库表
3. 将 `index.html` 中的 Supabase URL 和 anon key 替换为你自己的
4. 部署到任意静态文件服务器

```bash
# 使用 FastAPI 部署
pip install fastapi uvicorn
python serve.py
```

## 📋 数据库结构

- `users` — 用户表（昵称登录）
- `checkins` — 打卡记录（早起/晚睡/💩）
- `foods` — 食物库（名称+标签）
- `raid_sessions` — 副本场次
- `raid_signups` — 副本报名

## 🎮 关于

为燕云十六声游戏「透明」百业打造的社团工具。60人规模，萌系像素风。

---

*Built with 🩵 by YECI*
