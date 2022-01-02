# Steps to back up current macOS machine

This assumes you already have Dropbox, [Homebrew](https://brew.sh/), and [Mackup](https://github.com/lra/mackup) installed.

1) Run `brew bundle dump --force` to create a [Brewfile](https://github.com/Homebrew/homebrew-bundle) using [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand).
- The `--force` flag overwrites an existing Brewfile. It will overwrite the Dropbox file if it's already backed up.

2) Create a dir in ~ :
`mkdir .mackup && cd .mackup`

3) Create a file:
`touch my-files.cfg`

Add to following text to the file:

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
bash bin/strap.sh
```

Or go to `macos-strap.herokuapp.com`

2) Install Dropbox and wait until the Mackup folder syncs.
3) Install Mackup via Homebrew and run `mackup restore`
4) Run `brew bundle install`
5) Run `brew update && brew cu -a`

If you want your current system configuration to match your Brewfile:

`brew bundle --force cleanup`

# Switch to the newer Homebrew version of Bash:

1) Add Homebrew's Bash to /etc/shells:

- M1 Macs

```
sudo -i
echo /opt/homebrew/bin/bash >> /etc/shells
```

- Intel Macs

```
sudo -i
echo /usr/local/bin/bash >> /etc/shells
```

2) Change shell

- M1 Macs
`chsh -s /opt/homebrew/bin/bash`

- Intel Macs
`chsh -s /usr/local/bin/bash`
