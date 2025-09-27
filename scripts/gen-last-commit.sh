# brcheung

#!/usr/bin/env bash
set -euo pipefail

# 取最后一次提交时间（JST）
DATE_JST=$(TZ=Asia/Tokyo git log -1 --date='format:%Y-%m-%d' --format='%cd')
TIME_JST=$(TZ=Asia/Tokyo git log -1 --date='format:%H:%M' --format='%cd')
DOW_JST=$(TZ=Asia/Tokyo git log -1 --date='format:%a'   --format='%cd')  # Mon/Tue...

mkdir -p assets

cat > assets/last-commit.svg <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="520" height="120" viewBox="0 0 520 120" role="img" aria-label="Last commit (JST)">

  <rect x="0.5" y="0.5" width="519" height="119" rx="14" ry="14"
        fill="transparent" stroke="#263043" stroke-width="1"/>


  <text x="18" y="40"
        font-family="Inter, Arial, sans-serif"
        font-size="16" font-weight="700"
        fill="#C9D1D9">
    LAST COMMIT (JST) · ${DOW_JST}
  </text>


  <text x="18" y="86"
        font-family="JetBrains Mono, Menlo, Consolas, monospace"
        font-size="36" font-weight="800"
        fill="#36BCF7">
    ${DATE_JST}  ${TIME_JST}
  </text>
</svg>
EOF
