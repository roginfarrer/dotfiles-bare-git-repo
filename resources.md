## files to add

- Installing fish, and setting it to default
- Installing apps
  - Chrome, iTerm, VSCode, Station, TickTick, 1Password
- Setting up iTerm correctly

```bash
# comes from http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```
