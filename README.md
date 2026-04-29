# 🫧 百业工坊 · Guild Studio

给你的游戏社团搭一个专属 Web App — 一键部署，开箱即用。

> 为游戏社团打造的开源管理工具，开箱即用。

## ✨ 功能

- **登录系统** — 昵称登录，自动注册，无需密码
- **四主题换色** — 🌸樱花 / 🎋竹林 / 🌅暮色 / 🌙月夜
- **每日打卡** — 早起·晚睡·💩，日历展示，本周排行榜
- **食物扭蛋机** — tag加权随机筛选，成员可自由添加食物
- **副本报名** — 场次管理，指挥位+9人自助报名，管理员密码保护

## 🚀 快速部署

### 1. 创建 Supabase 项目

前往 [supabase.com](https://supabase.com) 创建免费项目，在 SQL Editor 中执行 `schema.sql` 创建所有表。

### 2. 配置

打开 `index.html`，修改顶部的配置区域：

```javascript
const CONFIG = {
  name: '你的百业名',          // 社团名称
  subtitle: 'YOUR STUDIO',   // 英文副标题
  icon: '🫧',                // 标签页图标
  adminPassword: '123456',   // 管理员密码
};
const SUPA = 'https://你的项目.supabase.co';
const KEY = '你的anon-key';
```

### 3. 部署

部署到任意静态文件服务器即可，只有一个 HTML 文件：

```bash
# 方式一：Python 快速启动
pip install fastapi uvicorn
python serve.py

# 方式二：直接用 nginx / Cloudflare Pages / Vercel / GitHub Pages
# 只需托管 index.html 即可
```

## 🛠️ 技术栈

- **前端**：单HTML文件，原生JS，零依赖
- **字体**：Zpix 中文像素字体
- **后端**：Supabase（PostgreSQL + REST API）
- **风格**：萌系像素风 🫧

## 📋 数据库结构

| 表名 | 用途 |
|------|------|
| `users` | 用户（昵称登录） |
| `checkins` | 打卡记录（早起/晚睡/💩） |
| `foods` | 食物库（名称+标签数组） |
| `raid_sessions` | 副本场次 |
| `raid_signups` | 副本报名 |

## 🎮 适用场景

- 游戏公会、百业、帮派等社团管理
- 小型社群的打卡互动工具
- 任何需要简单报名系统的团队

## 📝 License

MIT

---

*Built with 🩵 by [YECI](https://github.com/fedeligbad)*
