#!/usr/bin/env bash
set -euo pipefail

# 取最后一次提交时间（JST）
DATE_JST=$(TZ=Asia/Tokyo git log -1 --date='format:%Y-%m-%d' --format='%cd')
TIME_JST=$(TZ=Asia/Tokyo git log -1 --date='format:%H:%M' --format='%cd')
DOW_JST=$(TZ=Asia/Tokyo git log -1 --date='format:%a'   --format='%cd')  # Mon/Tue...

mkdir -p assets

# —— 保持当前“无滤镜、无复杂 defs”的安全样式 ——
cat > assets/last-commit.svg <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="520" height="120" role="img" aria-label="Last commit (JST)">
  <rect x="0" y="0" width="520" height="120" rx="14" fill="#0D1117" stroke="#263043" stroke-width="2"/>
  <text x="20" y="40" font-family="Inter, Arial, sans-serif" font-size="16" font-weight="700" fill="#C9D1D9">
    LAST COMMIT (JST) · ${DOW_JST}
  </text>
  <text x="20" y="86" font-family="JetBrains Mono, Menlo, Consolas, monospace"
        font-size="36" font-weight="800" fill="#36BCF7">
    ${DATE_JST}  ${TIME_JST}
  </text>
</svg>
EOF
