function fish_user_key_bindings
  ##fzf##
  # bind \et '__fzf_ctrl_t'
  # bind \cr '__fzf_ctrl_r'
  # bind \cx '__fzf_ctrl_x'
  # bind \ec '__fzf_alt_c'
  bind \ej '__fzf_alt_j'
  if bind -M insert > /dev/null ^ /dev/null
    # bind -M insert \et '__fzf_ctrl_t'
    # bind -M insert \cr '__fzf_ctrl_r'
    # bind -M insert \cx '__fzf_ctrl_x'
    # bind -M insert \ec '__fzf_alt_c'
    bind -M insert \ej '__fzf_alt_j'
  end
  ##fzf##
end
