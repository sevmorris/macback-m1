# macback

My method of backing up my current machine configuration and redeploying it on a new Mac or new macOS install.

## Back up current macOS machine

## Prerequisites
- Dropbox
- [Homebrew](https://brew.sh/)
- [Mackup](https://github.com/lra/mackup)
- [mas](https://github.com/mas-cli/mas) (Mac App Store command line interface)
---
1) Create a [Brewfile](https://github.com/Homebrew/homebrew-bundle) using [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand) to back up everything installed via Homebrew.

    - Create a Brewfile
`brew bundle dump --force` <br>
The --force flag overwrites an existing Brewfile. If the file is already backed up with Mackup it will overwrite the Dropbox file instead.

2) Create a config file to add files not officially supported by Mackup.

    - Create a directory:
`cd ~ && mkdir .mackup && cd .mackup`<br>

    - Create a config file:
`touch my-files.cfg`

Edit the file and add the following text:

```
[application]
name = My personal synced files and dirs

[configuration_files]
Brewfile
.bash_prompt
.hushlogin
```
(Files not backed up by Mackup go below [configuration_files])

Run `mackup backup`


## Set up a new macOS machine

1) Run [Strap](https://macos-strap.herokuapp.com/) either [from a browser](https://macos-strap.herokuapp.com/) or with the following commands:

```
git clone https://github.com/MikeMcQuaid/strap
cd strap
bash bin/strap.sh
```

(Strap installs Homebrew)

2) Install Dropbox and wait until the Mackup folder syncs.
3) Install Mackup via Homebrew and restore backed up files:

```
brew install mackup
mackup restore
```

4) Install all Homebrew apps from the Brewfile:
 `brew bundle install`

5) Clean up:
`brew update && brew cu -a`

## Switch to the Homebrew's newer version of Bash:

1) Add to /etc/shells:

    M1 Macs

```
sudo -i
echo /opt/homebrew/bin/bash >> /etc/shells
```

    Intel Macs

```
sudo -i
echo /usr/local/bin/bash >> /etc/shells
```

2) Change shell

    M1 Macs<br>
```
chsh -s /opt/homebrew/bin/bash
```

    \Intel Macs<br>
        
```
chsh -s /usr/local/bin/bash
```


## Tweak some Mac defaults and remove Dock icons (if a new OS install)

1) Clone this repo and execute the install script:

```
git clone https://github.com/sevmorris/macback.git ~/Downloads/macback && cd ~Downloads/macback
chmod 755 tweaks
./tweaks
```

2) That's it! Feel free to delete the folder:

```
cd ~
sudo rm -r ~/Downloads/macback
```
