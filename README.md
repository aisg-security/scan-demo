# AISG scan demo

This repository shows the [AISG Security Scan GitHub Action](https://github.com/aisg-security/scan-action)
on a pull request.

The `try-aisg` branch adds database rules that are **intentionally insecure** — the kind of
configuration AI coding tools often generate:

- Firebase Realtime Database rules with `.read: true` (anyone can read everything)
- Firestore rules with `allow read, write: if true`
- A Supabase table without Row Level Security

Open the pull request from `try-aisg` and AISG comments with what to fix first, and attaches
the full PDF report to the workflow run. Nothing in this repository is a real secret or a real
project — do not copy these rules into your app.

## Use it in your own repository

1. AISG dashboard → **Worker → Advanced: connect a second PC manually → Connect manually**.
2. Repository → **Settings → Secrets and variables → Actions**: add `AISG_WORKER` =
   `<worker_id>:<secret>`.
3. Copy [`.github/workflows/aisg.yml`](.github/workflows/aisg.yml).

Your code stays in your CI: the scanners run on the GitHub runner and AISG receives only finding
metadata. See the [action README](https://github.com/aisg-security/scan-action) for details.

This branch is the demo pull request: it adds the insecure rules above.

Scanned with aisg-security/scan-action@v1.
