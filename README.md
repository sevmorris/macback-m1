# Steps to back up current macOS machine

Run `brew bundle dump --force` to create a Brewfile. --force overwrites an existing Brewfile. It overwrites the file in Dropbox if it's backed up there with Mackup.
Create a dir: `~/.mackup`
Create a file in that dir: `my-files.cfg`
Add the following to the file:
```
[application]
name = My personal synced files and dirs

[configuration_files]
Brewfile
```
(Include anything else you'd like to backup below Brewfile.)

Run `mackup backup`


# Steps to set up a new macOS machine

1) Run [Strap](https://macos-strap.herokuapp.com/) using either of the following methods:

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

If you want your current system configuration to match your Brewfile:

`brew bundle --force cleanup`
