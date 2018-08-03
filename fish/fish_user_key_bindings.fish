 # enable keybindings
function fish_user_key_bindings
  # replaces && and ||
  bind "&&" 'commandline -i ";and"'
  bind "||" 'commandline -i ";or"'
end