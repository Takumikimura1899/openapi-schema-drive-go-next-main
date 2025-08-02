#!/bin/bash

# サブモジュールを最新版に更新するスクリプト

set -e  # エラーが発生したら即座に終了

echo "🔄 Updating all submodules to the latest version..."

# スクリプトのディレクトリから親ディレクトリ（プロジェクトルート）に移動
cd "$(dirname "$0")/.."

echo "📁 Project root: $(pwd)"

# Gitリポジトリかチェック
if [ ! -d ".git" ]; then
    echo "❌ Error: Not a git repository"
    exit 1
fi

# サブモジュールを更新
git submodule update --remote --merge

echo ""
echo "✅ Submodules updated successfully!"
echo "📝 Please review the changes and commit them if needed."

# 変更があるかチェック
if ! git diff --quiet; then
    echo ""
    echo "📋 Changes detected:"
    git status --short
else
    echo "📋 No changes detected"
fi
