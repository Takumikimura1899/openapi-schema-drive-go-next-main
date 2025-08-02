# 🚀 開発環境セットアップガイド

このプロジェクトは、API と Application の 2 つのサブモジュールで構成されています。各サブモジュール用の開発環境起動スクリプトを提供しています。

## 📁 プロジェクト構成

```
main-project/
├── api/           # Go API サブモジュール
├── application/   # Next.js Application サブモジュール
├── scripts/       # 開発環境起動スクリプト
├── schema/        # OpenAPI スキーマ定義
└── Makefile       # タスクランナー
```

## 🛠️ 使用方法

### 🎬 初回セットアップ

```bash
# 依存関係をインストール
make setup
# または
./scripts/setup.sh
```

### 🚀 開発環境起動

#### API 開発環境

```bash
# ローカルでAPIを起動
make api-dev
# または
./scripts/api-dev.sh

# DockerでAPIを起動
make api-docker
# または
./scripts/api-docker.sh

# Dockerコンテナを停止
make api-stop
# または
./scripts/api-stop.sh
```

#### Application 開発環境

```bash
# 依存関係をインストール
make app-install
# または
./scripts/app-install.sh

# Next.js開発サーバーを起動
make app-dev
# または
./scripts/app-dev.sh
```

#### 統合開発環境

```bash
# APIとApplicationを同時に起動
make dev-all
# または
./scripts/dev-all.sh
```

### 🔄 サブモジュール管理

```bash
# サブモジュールを最新版に更新
make update
# または
./scripts/update.sh
```

## 📋 利用可能なスクリプト

| スクリプト       | 機能                             | ポート     |
| ---------------- | -------------------------------- | ---------- |
| `api-dev.sh`     | API 開発環境起動（ローカル）     | 8080       |
| `api-docker.sh`  | API 開発環境起動（Docker）       | 8080       |
| `api-stop.sh`    | API コンテナ停止                 | -          |
| `app-dev.sh`     | Application 開発環境起動         | 3000       |
| `app-install.sh` | Application 依存関係インストール | -          |
| `dev-all.sh`     | 全環境同時起動                   | 3000, 8080 |
| `setup.sh`       | 初回セットアップ                 | -          |
| `update.sh`      | サブモジュール更新               | -          |

## 🔧 スクリプトの特徴

- **エラーハンドリング**: `set -e`でエラー時に即座に終了
- **ディレクトリチェック**: 必要なディレクトリとファイルの存在確認
- **自動依存関係インストール**: 必要に応じて自動でパッケージをインストール
- **わかりやすいログ**: 絵文字付きで実行状況を表示
- **相対パス対応**: スクリプトの場所に関係なく正しく動作

## 🎯 推奨ワークフロー

### 初回起動

```bash
# 1. 初回セットアップ
make setup

# 2. 開発環境起動（2つのターミナルで実行）
# ターミナル1
make api-dev

# ターミナル2
make app-dev
```

### 日常の開発

```bash
# まとめて起動（おすすめ）
make dev-all
```

### Docker 使用時

```bash
# Docker環境で起動
make api-docker

# 別ターミナルでApplication起動
make app-dev

# 作業終了時
make api-stop
```

## 🌐 アクセス URL

- **API**: http://localhost:8080
- **Application**: http://localhost:3000

## 🔍 トラブルシューティング

### ポートが使用中の場合

```bash
# ポート使用状況確認
lsof -i :3000
lsof -i :8080

# プロセス終了
kill -9 <PID>
```

### 依存関係エラーの場合

```bash
# 再セットアップ
make setup
```

### サブモジュールエラーの場合

```bash
# サブモジュール初期化
git submodule init
git submodule update

# 最新版に更新
make update
```
