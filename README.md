# 🫧 百业工坊 · Guild Studio

> 为游戏社团打造的开源管理工具，开箱即用。

![License](https://img.shields.io/badge/license-MIT-blue)
![Stack](https://img.shields.io/badge/stack-HTML%20%2B%20Supabase-orange)

## 📸 预览

| 登录 | 主页 | 打卡 |
|:---:|:---:|:---:|
| 昵称登录，自动注册 | 四大功能模块 | 日历视图 + 排行榜 |

| 食物扭蛋机 | 双十报名 | 四主题 |
|:---:|:---:|:---:|
| 167+ 食物 tag 筛选 | 指挥位 + 9 人报名 | 🌸🎋🌅🌙 |

> 📱 移动端优先设计，桌面端同样适配

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

```bash
# 方式一：Python
pip install fastapi uvicorn
python serve.py

# 方式二：任意静态服务器
# 只需托管 index.html 即可
# 支持 Nginx / Cloudflare Pages / Vercel / GitHub Pages
```

## 🛠️ 技术栈

- **前端**：单HTML文件，原生JS，零依赖
- **字体**：[Zpix](https://github.com/SolidZORO/zpix-pixel-font) 中文像素字体
- **后端**：[Supabase](https://supabase.com)（PostgreSQL + REST API）
- **风格**：萌系像素风 🫧

## 📋 数据库

| 表名 | 用途 |
|------|------|
| `users` | 用户（昵称登录） |
| `checkins` | 打卡记录（早起/晚睡/💩） |
| `foods` | 食物库（名称+标签数组） |
| `raid_sessions` | 副本场次 |
| `raid_signups` | 副本报名 |

详见 [`schema.sql`](schema.sql)

## 🎮 适用场景

- 游戏公会、百业、帮派等社团管理
- 小型社群的打卡互动工具
- 任何需要简单报名系统的团队

## 📝 License

[MIT](LICENSE)

---

*Built with 🩵 by [YECI](https://github.com/fedeligbad)*
