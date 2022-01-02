# To set up a new macOS machine

1) Run strap using either of the following methods:


```
git clone https://github.com/MikeMcQuaid/strap
cd strap
bash bin/strap.sh # or bash bin/strap.sh --debug for more debugging output
```

Or go to `macos-strap.herokuapp.com`


2) Install Dropbox and wait until the Mackup folder syncs.
3) Install Mackup via Homebrew and run `mackup restore`
4) Run `brew bundle install`
5) Run `brew update && brew cu -a`


If you want your current system configuration to match your brewfile

`brew bundle --force cleanup`
