config_git_hooks:
	git config core.hooksPath .githooks

new_version:
	./scripts/update_version.sh
