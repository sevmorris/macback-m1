# macback

My methods of configuring, deploying and redeploying macOS (on an M1 Mac).


[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
:ukraine:

:exclamation: I'm pretty new to this, and I'm unable to resist banging away at it almost every day. It has already changed *a lot* since, say, last week. Or even last Thursday. Ok, since this morning. Anyway, it's _very much_ a WIP. My door is always open if anyone has any feedback, tips or suggestions.

## Tasks

- Switch to Bash
- Run [Strap](https://github.com/MikeMcQuaid/strap)
- Run some scripts
- Brewfile
- Switch to new Bash

---
#### Switch to Bash

  macOS comes with [zsh](https://support.apple.com/en-us/HT208050) as the default shell, but I use Bash:

  <br>

  ```
  chsh -s /bin/bash && reset
  ```

<br>

---
Run Strap *(maybe)*.

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
#### Run some scripts

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
#### Brewfile

You can create a [Brewfile](https://github.com/Homebrew/homebrew-bundle) using [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand) to index everything installed with Homebrew and the Mac App Store.

<br>

_If_ you have a Github repo (called "homebrew-brewfile") with your Brewfile and you decide to run Strap then Strap should use that repo to install apps.

---
To create a "master list" Brewfile:

```
brew bundle dump --force --describe
```

> `--force` overwrites an existing Brewfile.<br>
> `--describe` adds a brief description for each entry.

Again, this is a *complete* list of apps installed via Homebrew and the Mac App Store. For practical purposes I maintain a curated Brewfile that lives in a Github repo. I would rather manage mas apps manually, and I definitely do not want to install every cask I have every time I start fresh. Strap will use this list to install my selected apps.

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
brewup
```

---
#### Switch to new Bash

> A newer version of Bash is installed via Homebrew. Time to switch to that.


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
#### Select aliases

<details>
  <summary>audit</summary>
<br>
Runs a system audit using security and system auditing tool Lynis.

</details>


<details>
  <summary>backup</summary>
<br>
Backs up dotfiles and ~/Library/Preferences, (not including files listed in .excludes-file.txt) to a Dropbox folder.

  </details>


<details>
  <summary>brewup</summary>
<br>
Updates, upgrades & cleans up Homebrew.

  </details>


<details>
  <summary>cat</summary>
<br>
Opens a file with cat clone bat.

</details>


<details>
  <summary>df</summary>
<br>
Gives an overview of the filesystem disk space usage using Disk Usage/Free utility (duf) instead of df.

  </details>


<details>
  <summary>man</summary>
<br>
Replaces man with the simplified and community-driven tldr.

</details>


<details>
  <summary>open</summary>
<br>
Opens file for editing in the text editor micro.  

  </details>


<details>
  <summary>shrug</summary>
<br>
Copies ¯\_(ツ)_/¯ to the clipboard

  </details>


<details>
  <summary>syncall</summary>
<br>
I maintain two copies of .aliases and Brewfile and edit them regularly. This syncs both versions & pushes them to Github. (synca will sync just the .aliases files and syncb will sync just the Brewfiles)

  </details>


<details>
  <summary>update</summary>
<br>
Gets macOS Software Updates, and updates installed Ruby gems, npm, and their installed packages.

  </details>


---
#### Notes

- Some of my dotfiles (.aliases, .bashrc, etc) live in ~/dotfiles and a Github repo. Locally they're symlinked in ~/.<br>
- My Brewfile lives in ~/homebrew-brewfile  and a Guthub repo.<br>
- If you run Strap and have these repos it should pull from both.
- There's an alias (`backup`) for backing up user preferences and some dotfiles (excluding the ones in ~/dotfiles. It rsyncs to a Dropbox folder, which you would need to create before running. Refer to the alias for dir names.<br>
- There's a file (~/excludes-file.txt) that lists anything that doesn't need to (or shouldn't) be included in the backup.
I've barely started figuring that out, so the list will grow.

---
#### Finished

It wouldn't hurt to reboot soon.

---
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

Obligatory shoutout to [mathiasbynens](https://github.com/mathiasbynens/dotfiles/blob/main/.macos) for the many `defaults`.
