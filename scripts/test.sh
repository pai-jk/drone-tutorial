#!/bin/bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || realpath "$(dirname "$0")/..")"
PROJ="${ROOT}/project"

echo "🧪 Tests in ${PROJ}"
cd "${PROJ}"

command -v python3 >/dev/null 2>&1 || apk add --no-cache python3 py3-pip
python3 -m pip install --no-cache-dir -U pip pytest

# src 레이아웃 인식 보장
PYTHONPATH="${PROJ}/src" pytest
echo "✅ Tests passed."