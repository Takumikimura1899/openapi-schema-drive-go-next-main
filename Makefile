# 全てのサブモジュールをリモートの最新版に更新し、変更をコミットする準備をします
update:
	@echo "Updating all submodules to the latest version..."
	git submodule update --remote --merge
	@echo "\nSubmodules updated. Please review the changes and commit them."

.PHONY: update
