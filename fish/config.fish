# Set prompt

source ~/.config/fish/conf.d/omf.fish

set -x FZF_DEFAULT_OPTS  "--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"

source ~/.config/fish/fish_prompt.fish
source ~/.config/fish/aliases.fish
source ~/.config/fish/variables.fish
source ~/.config/fish/functions/taskwarrior.fish

