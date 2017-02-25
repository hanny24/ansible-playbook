# Set prompt

source ~/.config/fish/conf.d/omf.fish

set -x TMPDIR /tmp
set -x FZF_DEFAULT_OPTS  "--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"
# set fisher_home ~/.local/share/fisherman
# set fisher_config ~/.config/fisherman
# source $fisher_home/config.fish

source ~/.config/fish/fish_prompt.fish
source ~/.config/fish/aliases.fish
source ~/.config/fish/functions/taskwarrior.fish

set -x EDITOR nvim
set -x PATH $HOME/.rbenv/shims $HOME"/.bin" $HOME"/local/bin" /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin /usr/bin/vendor_perl /usr/bin/core_perl $HOME"/.gem/ruby/2.4.0/bin" $HOME/.local/bin $HOME/.cargo/bin $HOME/work/atlanta/atlanta-cluster-tools/bin
set -x M2_HOME "/opt/maven"
set -x _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
set -x JAVA_HOME /usr/lib/jvm/default
set -x HOSTALIASES ~/.hosts
