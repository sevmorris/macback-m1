# macback

My methods of configuring, deploying and redeploying macOS using a couple of preexisting tools ([Strap](https://github.com/MikeMcQuaid) & [Mackup](https://github.com/lra)) and a few of my own scripts.

## Tasks

#### Switch to Bash

  macOS comes with [zsh](https://support.apple.com/en-us/HT208050) as the default shell, but I use Bash:

  <br>

  ```
  chsh -s /bin/bash && reset
  ```

<br>

---
#### Run custom scripts

Tweak some Mac defaults, add some dotfiles, and (optionally) remove Dock icons (useful for a new OS install).

<br>

> :point_right: This will overwrite .aliases, .bashrc & .bash_prompt if they already exist.<br>
> :point_right: Review [macdefaults.sh](scripts/macdefaults.sh) and remove what you don't want.

<br>

Clone the repo and run the scripts:

```
git clone https://github.com/sevmorris/macback.git && cd macback/scripts
chmod 755 tweaks.sh
./tweaks.sh && cd ~
```

<br>

---
Run [Strap](https://github.com/MikeMcQuaid/strap) *(maybe)*.

>A script to bootstrap a minimal macOS development system. This does not assume you're doing Ruby/Rails
> web development but installs the minimal set of software every macOS developer will want.

<br>

<details>
  <summary>What Strap does</summary>

<br>

- Disables Java in Safari (for better security)
- Enables the macOS screensaver password immediately (for better security)
- Enables the macOS application firewall (for better security)
- Adds a Found this computer? message to the login screen (for machine recovery)
- Enables full-disk encryption and saves the FileVault Recovery Key to the Desktop (for better security)
- Installs the Xcode Command Line Tools (for compilers and Unix tools)
- Agree to the Xcode license (for using compilers without prompts)
- Installs Homebrew (for installing command-line software)
- Installs Homebrew Bundle (for bundler-like Brewfile support)
- Installs Homebrew Services (for managing Homebrew-installed services)
- Installs Homebrew Cask (for installing graphical software)
- Installs the latest macOS software updates (for better security)
- Installs dotfiles from a user's https://github.com/username/dotfiles repository. If they exist and are executable: runs script/setup to configure the dotfiles and script/strap-after-setup after setting up everything else.
- Installs software from a user's Brewfile in their https://github.com/username/homebrew-brewfile repository or .Brewfile in their home directory.
- A simple web application to set Git's name, email and GitHub token (needs authorised on any organisations you wish to access)
- Idempotent

</details>

<br>

If you _do not_ want to run Strap:

<details>
  <summary>do this</summary>

---
Install [Homebrew](https://brew.sh/):


```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

<br>

Install Xcode Command Line Tools:


```
xcode-select --install
```

</details>

<br>

If you _do_ want to run Strap:

<details>
  <summary>Do this</summary>

---

```
git clone https://github.com/MikeMcQuaid/strap
cd strap
bash bin/strap.sh
```

Alternatively, you can run [Strap in a browser](https://macos-strap.herokuapp.com/).

</details>

<br>

---
#### Install, configure and run Mackup

_For backing up dotfiles & (some) preferences._

<br>

<details>
  <summary>Create backup folders</summary>

---

```
mkdir ~/backups && mkdir ~/backups/mackup
```

<br>

</details>

<details>
  <summary>Install & configure Mackup</summary>

---

```
brew install mackup
```

<br>

Create a .cfg file for Mackup:

```
nano ~/.mackup.cfg
```

<br>

Add the following text and save:

```
[storage]
engine = file_system
path = backups
directory = mackup
```

<br>

Run Mackup backup

```
mackup backup
```

</details>

---
#### Brewfile

You can create a [Brewfile](https://github.com/Homebrew/homebrew-bundle) using [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand) to index everything installed with Homebrew and the Mac App Store.

<br>

To create a "master list" Brewfile:

```
brew bundle dump --force --describe
```

> `--force` overwrites an existing Brewfile.<br>
> `--describe` adds a brief description for each entry.

---
To install via the Brewfile:

> This will install everything listed in the Brewfile. You should probably have a look and remove anything you don't want to install now, or move my curated Brewfile to ~/ instead.

```
cd ~
brew bundle install
```

<br>

Clean up (using one of the new aliases):

```
cleanbrew
```

---
#### Switch to new Bash

##### Intel Macs

```
sudo -i
echo /usr/local/bin/bash >> /etc/shells
exit
chsh -s /usr/local/bin/bash
```

##### M1 Macs

```
sudo -i
echo /opt/homebrew/bin/bash >> /etc/shells
exit
chsh -s /opt/homebrew/bin/bash
```

<br>

> :point_right: **Restart** the terminal or open a new tab for the change to take effect.



---
#### Cleanup

<br>

Delete the repo folder:

```
rm -r $HOME/macback
```

---
#### Aliases

<details>
  <summary>Partial list of aliases included</summary>


##### Replace default commands

- List in tree form using exa<br>
`tree`

- Send files and folders to Trash instead of deleting<br>
`rm`

- Use micro instead of nano<br>
`nano`

- Use fd instead of find<br>
`find`

- Use duf instead of du<br>
`du`

- Use bat instead of cat<br>
`cat`

- Replace man with tldr<br>
`man`


##### Listing

- List all & sort by modification date with most recent first and directories first<br>
`lm`

- List only visible files & folders<br>
`ll`<br>
`ld`

- List all files and folders<br>
`la`

- List only (and all) files<br>
`lf`<br>
`files`

- Print each PATH entry on a separate line<br>
`path`


##### Clean up and update

- Recursively delete `.DS_Store` files (wipes out Desktop layout)<br>
`cleands`

- Flush Directory Service cache<br>
`flush`

- Clean up Homebrew<br>
`cleanbrew`

- Run brew-cask-upgrade and force it to update everything<br>
`Brewup`

- Get macOS Software Updates, and update installed Ruby gems, npm, and their installed packages<br>
`update`

- Back up dotfiles and preferences with mackup<br>
`mackup`

- Backup preferences locally then remotely<br>
`backup`

- Update dotfiles in ~/ if modified in macback<br>
`dots`

- brew uninstall <app name><br>
`unbrew`


##### Everything else

- Clear the terminal<br>
`c`

- Turn off the screen<br>
`s`

- sudo<br>
`please`

- Reload the shell (i.e. invoke as a login shell)<br>
`reload`

- Run gtop<br>
`mon`

- cd to Desktop or Downloads<br>
`dl`<br>
`dt`

- Copy a shrug to the clipboard<br>
`shrug`

- Run a system audit using Lynis<br>
`scan`<br>
`audit`

- Open Brewfile in nano (micro)<br>
`brewfile`

</details>

---
#### Finish

Please reboot soon. Like _really_ soon.

---
#### Thank you to the following for the handful of incredibly useful preexisting tools

[Mike McQuaid](https://github.com/MikeMcQuaid) for Strap.<br>
[Laurent Raufaste](https://github.com/lra) for Mackup.<br>

Obligatory shoutout to [mathiasbynens](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
