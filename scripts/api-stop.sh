#!/bin/bash

# APIのDockerコンテナを停止するスクリプト

set -e  # エラーが発生したら即座に終了

echo "🛑 Stopping API Docker containers..."

# スクリプトのディレクトリから親ディレクトリ（プロジェクトルート）に移動
cd "$(dirname "$0")/.."

# apiディレクトリが存在するかチェック
if [ ! -d "api" ]; then
    echo "❌ Error: api directory not found"
    exit 1
fi

# apiディレクトリに移動
cd api

# docker-compose.yamlが存在するかチェック
if [ ! -f "docker-compose.yaml" ] && [ ! -f "docker-compose.yml" ]; then
    echo "❌ Error: docker-compose.yaml not found in api directory"
    exit 1
fi

echo "📁 Current directory: $(pwd)"
echo "🔧 Running: docker-compose down"
docker-compose down

echo "✅ API Docker containers stopped successfully"
