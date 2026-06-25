#!/bin/bash
# clean-cache.sh — 清除 Yundashi Agent Desktop 所有持久化数据
# 用于重置为首次安装状态(清空 gateway 配置、onboarding 缓存、cookies 等)

set -euo pipefail

echo "即将清除以下目录(所有持久化数据):"
echo "  1. ~/Library/Application Support/Yundashi Agent/"
echo "  2. ~/Library/Application Support/Hermes/  (旧版本残留)"
echo "  3. ~/.hermes/"
echo

read -rp "确认删除? 输入 yes 继续: " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
  echo "已取消。"
  exit 0
fi

echo
echo "正在清理..."

rm -rf ~/Library/Application\ Support/Yundashi\ Agent/
echo "  ✓ ~/Library/Application Support/Yundashi Agent/"

rm -rf ~/Library/Application\ Support/Hermes/
echo "  ✓ ~/Library/Application Support/Hermes/"

rm -rf ~/.hermes
echo "  ✓ ~/.hermes"

echo
echo "清理完成。重新启动 npm run dev 即等同于首次安装。"
