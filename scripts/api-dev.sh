#!/bin/bash

# APIサブモジュールの開発環境を起動するスクリプト

set -e  # エラーが発生したら即座に終了

echo "🚀 Starting API development environment..."

# スクリプトのディレクトリから親ディレクトリ（プロジェクトルート）に移動
cd "$(dirname "$0")/.."

# apiディレクトリが存在するかチェック
if [ ! -d "api" ]; then
    echo "❌ Error: api directory not found"
    exit 1
fi

# apiディレクトリに移動してmake devを実行
cd api

# Makefileが存在するかチェック
if [ ! -f "Makefile" ]; then
    echo "❌ Error: Makefile not found in api directory"
    exit 1
fi

echo "📁 Current directory: $(pwd)"
echo "🔧 Running: make dev"
make dev
