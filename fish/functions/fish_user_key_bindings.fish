function fish_user_key_bindings
  bind \ef fzf-file-widget
  bind \eh fzf-history-widget
  bind \ec fzf-cd-widget
  bind \ej fzf-fasd-dir

  if bind -M insert > /dev/null 2>&1
    bind -M insert \ef fzf-file-widget
    bind -M insert \eh fzf-history-widget
    bind -M insert \ec fzf-cd-widget
    bind -M insert \ej fzf-fasd-dir
  end
end
