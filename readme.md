# Rogin Farrer's Dotfiles

Maintained via a bare Git repository. https://www.atlassian.com/git/tutorials/dotfiles

Haven't set up any fun automation scripts yet, so will need follow above instructions 👆

I think this is all I need to install on a new machine?

```sh
git clone --bare https://github.com/roginfarrer/dotfiles.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
