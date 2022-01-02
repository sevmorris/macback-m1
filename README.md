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

1) Run [Strap](https://macos-strap.herokuapp.com/) either [from a browser](https://macos-strap.herokuapp.com/) or with the following commands:

```
git clone https://github.com/MikeMcQuaid/strap
cd strap
bash bin/strap.sh
```

(Strap installs Homebrew)

2) Install Dropbox and wait until the Mackup folder syncs.
3) Install Mackup via Homebrew and run the restore:

```
brew install mackup
mackup restore
```

4) Install all Homebrew apps from the Brewfile:
 `brew bundle install`

5) Clean up:
`brew update && brew cu -a`

# Switch to the Homebrew's newer version of Bash:

1) Add to /etc/shells:

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

Restart.
