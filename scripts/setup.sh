#!/bin/bash

# 開発環境のセットアップスクリプト（初回用）

set -e  # エラーが発生したら即座に終了

echo "🚀 Setting up development environment..."

# スクリプトのディレクトリから親ディレクトリ（プロジェクトルート）に移動
cd "$(dirname "$0")/.."

echo "📁 Project root: $(pwd)"

# Applicationの依存関係をインストール
if [ -d "application" ]; then
    echo "📦 Installing Application dependencies..."
    cd application
    if [ -f "package.json" ]; then
        npm install
        echo "✅ Application dependencies installed"
    else
        echo "⚠️  Warning: package.json not found in application directory"
    fi
    cd ..
else
    echo "⚠️  Warning: application directory not found"
fi

# APIの依存関係を整理
if [ -d "api" ]; then
    echo "🔧 Setting up API dependencies..."
    cd api
    if [ -f "go.mod" ]; then
        go mod tidy
        echo "✅ API dependencies organized"
    else
        echo "⚠️  Warning: go.mod not found in api directory"
    fi
    cd ..
else
    echo "⚠️  Warning: api directory not found"
fi

echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "  - To start API: ./scripts/api-dev.sh"
echo "  - To start Application: ./scripts/app-dev.sh"
echo "  - To start both: ./scripts/dev-all.sh"
