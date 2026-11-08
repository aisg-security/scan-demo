-- Planted vulnerabilities for AISG cloudrules ground-truth (FP-rate harness).
-- Each table below maps to one label in labels.json.

-- AISG-RLS-001: users table WITHOUT row level security
CREATE TABLE users (
    id bigint primary key,
    email text not null
);

-- AISG-RLS-002: orders table RLS-enabled but NO policy
CREATE TABLE orders (
    id bigint primary key,
    user_id bigint
);
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;

-- AISG-RLS-003: posts table with permissive policy USING (true)
CREATE TABLE posts (
    id bigint primary key,
    title text
);
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public_read_all" ON posts FOR SELECT USING (true);
