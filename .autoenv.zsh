if [[ -e ~/.dotfiles/bin/github_issues ]]; then
	issues=$(~/.dotfiles/bin/github_issues)
	if (( issues > 0 )); then
	echo "$(~/.dotfiles/bin/github_issues)" > .issues
	fi
fi
