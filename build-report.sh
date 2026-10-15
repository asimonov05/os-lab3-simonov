#!/bin/bash
# Один отчёт по обоим предметам. Запускать из любой директории.
set -euo pipefail
export LC_ALL=C
cd "$(dirname "$0")/labfiles-3-26"

cat */tests/TEST-* |
  grep -E '^[^;]+;[^;]+;2026-[0-9]{2}-[0-9]{2};[0-9]+;[3-5][-+]*$' |
  sed -E 's/^([^;]+)-[0-9]{2};([^;]+);[^;]+;[^;]+;([^;]+)$/\2,\1,\3/' |
  sort > ../report-SimonovAR.txt

threes=$(cat */tests/TEST-* |
  grep -Ec '^[^;]+;[^;]+;202[4-6]-[0-9]{2}-[0-9]{2};[0-9]+;3$')
printf '\nВсего оценок ровно 3 за 2024–2026 годы по всем тестам: %s\n' "$threes" \
  >> ../report-SimonovAR.txt
