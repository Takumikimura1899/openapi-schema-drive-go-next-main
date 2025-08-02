#!/bin/bash

# Applicationサブモジュールの開発環境を起動するスクリプト

set -e  # エラーが発生したら即座に終了

echo "⚛️ Starting Application development environment..."

# スクリプトのディレクトリから親ディレクトリ（プロジェクトルート）に移動
cd "$(dirname "$0")/.."

# applicationディレクトリが存在するかチェック
if [ ! -d "application" ]; then
    echo "❌ Error: application directory not found"
    exit 1
fi

# applicationディレクトリに移動
cd application

# package.jsonが存在するかチェック
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found in application directory"
    exit 1
fi

# node_modulesが存在しない場合は依存関係をインストール
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

echo "📁 Current directory: $(pwd)"
echo "🔧 Running: npm run dev"
npm run dev
