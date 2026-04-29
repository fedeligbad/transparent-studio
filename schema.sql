-- 百业工坊 数据库结构
-- Supabase PostgreSQL

-- 用户表
CREATE TABLE users (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  nickname text UNIQUE NOT NULL,
  is_admin boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

-- 打卡表
CREATE TABLE checkins (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id uuid REFERENCES users(id) ON DELETE CASCADE,
  type text NOT NULL CHECK (type IN ('early', 'sleep', 'poop')),
  date date NOT NULL DEFAULT CURRENT_DATE,
  created_at timestamptz DEFAULT now()
);

-- 早起和晚睡每天一次，💩不限
CREATE UNIQUE INDEX unique_early_sleep_per_day 
  ON checkins(user_id, type, date) 
  WHERE type IN ('early', 'sleep');

-- 食物库
CREATE TABLE foods (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name text NOT NULL,
  tags text[] DEFAULT '{}',
  created_by uuid REFERENCES users(id),
  created_at timestamptz DEFAULT now()
);

-- 副本场次
CREATE TABLE raid_sessions (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  date date NOT NULL,
  time_slot text NOT NULL,
  commander_id uuid REFERENCES users(id),
  created_by uuid REFERENCES users(id),
  created_at timestamptz DEFAULT now()
);

-- 副本报名
CREATE TABLE raid_signups (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  session_id uuid REFERENCES raid_sessions(id) ON DELETE CASCADE,
  user_id uuid REFERENCES users(id) ON DELETE CASCADE,
  slot_number int NOT NULL CHECK (slot_number BETWEEN 0 AND 9),
  created_at timestamptz DEFAULT now(),
  UNIQUE(session_id, slot_number),
  UNIQUE(session_id, user_id)
);

-- RLS
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE checkins ENABLE ROW LEVEL SECURITY;
ALTER TABLE foods ENABLE ROW LEVEL SECURITY;
ALTER TABLE raid_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE raid_signups ENABLE ROW LEVEL SECURITY;

-- anon 读写策略
CREATE POLICY "anon_read" ON users FOR SELECT TO anon USING (true);
CREATE POLICY "anon_insert" ON users FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "anon_delete" ON users FOR DELETE TO anon USING (true);
CREATE POLICY "anon_update" ON users FOR UPDATE TO anon USING (true);

CREATE POLICY "anon_read" ON checkins FOR SELECT TO anon USING (true);
CREATE POLICY "anon_insert" ON checkins FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "anon_delete" ON checkins FOR DELETE TO anon USING (true);

CREATE POLICY "anon_read" ON foods FOR SELECT TO anon USING (true);
CREATE POLICY "anon_insert" ON foods FOR INSERT TO anon WITH CHECK (true);

CREATE POLICY "anon_read" ON raid_sessions FOR SELECT TO anon USING (true);
CREATE POLICY "anon_insert" ON raid_sessions FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "anon_delete" ON raid_sessions FOR DELETE TO anon USING (true);
CREATE POLICY "anon_update" ON raid_sessions FOR UPDATE TO anon USING (true);

CREATE POLICY "anon_read" ON raid_signups FOR SELECT TO anon USING (true);
CREATE POLICY "anon_insert" ON raid_signups FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "anon_delete" ON raid_signups FOR DELETE TO anon USING (true);
