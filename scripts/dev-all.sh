#!/bin/bash

# 両方のサブモジュールを同時に起動するスクリプト

echo "🚀 Starting all development environments..."

# スクリプトのディレクトリから親ディレクトリ（プロジェクトルート）に移動
cd "$(dirname "$0")/.."

# APIを起動（バックグラウンド）
echo "🔧 Starting API in background..."
if [ -d "api" ]; then
    cd api
    if [ -f "Makefile" ]; then
        make run &
        API_PID=$!
        echo "✅ API started with PID: $API_PID"
    else
        echo "❌ Error: Makefile not found in api directory"
        exit 1
    fi
    cd ..
else
    echo "❌ Error: api directory not found"
    exit 1
fi

# 少し待機
sleep 2

# Applicationを起動（フォアグラウンド）
echo "⚛️ Starting Application..."
if [ -d "application" ]; then
    cd application
    if [ -f "package.json" ]; then
        # node_modulesが存在しない場合は依存関係をインストール
        if [ ! -d "node_modules" ]; then
            echo "📦 Installing dependencies first..."
            npm install
        fi
        npm run dev
    else
        echo "❌ Error: package.json not found in application directory"
        # APIプロセスを終了
        kill $API_PID 2>/dev/null || true
        exit 1
    fi
else
    echo "❌ Error: application directory not found"
    # APIプロセスを終了
    kill $API_PID 2>/dev/null || true
    exit 1
fi

# スクリプト終了時にバックグラウンドプロセスを終了
trap "kill $API_PID 2>/dev/null || true" EXIT
