# macback

My methods of configuring, deploying and redeploying macOS using a handful or preexisting tools and a couple of my own scripts.

## Tasks

#### Switch to Bash

  macOS comes with [zsh](https://support.apple.com/en-us/HT208050) as the default shell, but I use Bash:

  <br>

  ```
  chsh -s /bin/bash && reset
  ```

---
#### Run custom script

Tweak some Mac defaults, add some dotfiles, and (optionally) remove Dock icons (useful for a new OS install).

<br>

> :point_right: This will overwrite .aliases, .bashrc & .bash_prompt if they already exist.<br>
> :point_right: Review [macdefaults.sh](scripts/macdefaults.sh) and remove what you don't want.

<br>

Clone the repo and run the scripts:

```
git clone https://github.com/sevmorris/macback.git && cd macback/scripts
chmod 755 tweaks.sh
./tweaks.sh
```

---
#### Bootstrap


Run [Strap](https://github.com/MikeMcQuaid/strap) *(maybe)*.

<br>

> :point_down: Strap does a lot of stuff.

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

If this seems like more than you're comfortable with:

<details>
  <summary>I *do not* want to run Strap</summary>

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

Otherwise:

<details>
  <summary>I *do* want to run Strap</summary>

---

```
git clone https://github.com/MikeMcQuaid/strap
cd strap
bash bin/strap.sh
```

</details>

---
#### Mackup, macgnu & Brewfile

_For backing up dotfiles & (some) preferences and installing apps with Homebrew._

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
</details>

<details>
  <summary>Install GNU apps with macgnu</summary>

---
What [macgnu](https://github.com/shinokada/macgnu) does:

- installs missing GNU programs
- updates outdated GNU programs
- replaces pre-installed BSD programs with their preferred GNU implementations

<br>

```
git clone https://github.com/shinokada/macgnu.git
cd macgnu
./macgnu install
```

<br>

</details>
<details>
  <summary>Install apps with Homebrew</summary>

---

This will install everything listed in your Brewfile.

```
brew bundle install
```

> I include a curated [Brewfile](https://github.com/Homebrew/homebrew-bundle) in this repo
> that excludes casks and Mac App Store apps, as well as everything already installed via
> [macgnu](https://github.com/shinokada/macgnu).

<br>

Clean up (using one of the new aliases):

```
cleanbrew
```

</details>
</details>

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
#### Back up your Mac

> :pushpin: You _can_ create a [Brewfile](https://github.com/Homebrew/homebrew-bundle) using
> [Homebrew Bundle](https://docs.brew.sh/Manpage#bundle-subcommand). This indexes everything
> installed with Homebrew and the Mac App Store.<br>

> Bundle is convenient for backup up a master list, but I thinks it's overkill
> for reinstalling apps. I maintain a curated Brewfile that includes my essentials.

<br>

To create a "master list" Brewfile:

```
brew bundle dump --force --describe
```

> `--force` overwrites an existing Brewfile.<br>
> `--describe` adds a brief description for each entry.

<br>

Run Mackup backup

> Review "Bootstrap your Mac" above for installing and configuring Mackup.

<br>

```
mackup backup
```

<br>

> Consider creating a GitHub repo or cloud storage location to store and track backups (working on adding
> instructions here).

---
#### Cleanup

<br>

Delete the repo folder:

```
rm -r $HOME/macback
```

---
#### Finish

Please reboot soon. Like _really_ soon.


---
#### Thank you to the following for the handful of incredibly useful preexisting tools

[Laurent Raufaste](https://github.com/lra)<br>
[Shinichi Okada](https://github.com/shinokada)<br>
[Mike McQuaid](https://github.com/MikeMcQuaid)<br>

Obligatory shoutout to [mathiasbynens](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
