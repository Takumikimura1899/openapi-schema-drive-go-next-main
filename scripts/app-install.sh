#!/bin/bash

# Applicationサブモジュールの依存関係をインストールするスクリプト

set -e  # エラーが発生したら即座に終了

echo "📦 Installing Application dependencies..."

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

echo "📁 Current directory: $(pwd)"
echo "🔧 Running: npm install"
npm install

echo "✅ Dependencies installed successfully"
