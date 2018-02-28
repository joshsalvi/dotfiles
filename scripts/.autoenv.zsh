if [[ -e ~/.dotfiles/bin/github_issues ]]; then
	git_url=$(git remote get-url origin)
	if [[ -d .git ]] && [[ "$git_url" = *'github.com'* ]]; then
		echo "Fetching Github Issues..."
		issues=$(~/.dotfiles/bin/github_issues)
		if (( issues > 0 )); then
			echo "$(~/.dotfiles/bin/github_issues)" > .issues
		fi
	fi
fi
