# 全てのサブモジュールをリモートの最新版に更新し、変更をコミットする準備をします
update:
	@./scripts/update.sh

# APIサブモジュールの開発環境を起動
api-dev:
	@./scripts/api-dev.sh

# APIサブモジュールをDockerで起動
api-docker:
	@./scripts/api-docker.sh

# APIサブモジュールのDockerを停止
api-stop:
	@./scripts/api-stop.sh

# Applicationサブモジュールの開発環境を起動
app-dev:
	@./scripts/app-dev.sh

# Applicationサブモジュールの依存関係をインストール
app-install:
	@./scripts/app-install.sh

# 両方のサブモジュールを同時に起動
dev-all:
	@./scripts/dev-all.sh

# 開発環境のセットアップ（初回用）
setup:
	@./scripts/setup.sh

.PHONY: update api-dev api-docker api-stop app-dev app-install dev-all setup
