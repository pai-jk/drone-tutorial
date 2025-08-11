#!/bin/bash
set -euo pipefail

# repo 루트 계산
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || realpath "$(dirname "$0")/..")"
PROJ="${ROOT}/project"

echo "🔍 Lint in ${PROJ}"
cd "${PROJ}"

# 파이썬/툴 준비 (이미지에 python 포함이지만, alpine 전환 시 대비)
command -v python3 >/dev/null 2>&1 || apk add --no-cache python3 py3-pip
python3 -m pip install --no-cache-dir -U pip flake8

flake8 src tests
echo "✅ Lint passed."