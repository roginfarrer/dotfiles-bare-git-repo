To set up, simply run:

```bash
mkdir ~/.dotfiles
cd ~/.dotfiles
git clone https://github.com/roginfarrer/dotfiles.git
./install
```

## My Todo List

- Installing fish, oh-my-fish, plugins, and setting it to default
  - https://bpinto.github.io/oh-my-fish/
  - plugins: spacefish, pisces, z
- Installing apps
  - Chrome, iTerm, VSCode, Station, TickTick, 1Password
- Setting up iTerm correctly:

```bash
# comes from http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# will download night owl theme
curl 'https://raw.githubusercontent.com/nickcernis/iterm2-night-owl/master/Night%20Owl.itermcolors' > iterm/night_owl.itermcolors
```
