# macback [M1 edition]

Configure & deploy macOS on a Mac with Apple silicon.

See [macback - Intel edition](https://github.com/sevmorris/macback-intel) for Intel Macs.


[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)<br>
:ukraine:

## Tasks

- Switch to Bash
- Run [Strap](https://github.com/MikeMcQuaid/strap)
- Run a script to tweak some Mac preferences
- Brewfile
- Switch to new Bash

---
### Switch to Bash

  macOS comes with [zsh](https://support.apple.com/en-us/HT208050) as the default shell, but I use Bash:

  <br>

  ```
  chsh -s /bin/bash && reset
  ```

<br>

---
Run Strap *(maybe)*.

> A script to bootstrap a minimal macOS development system. This does not assume you're doing Ruby/Rails
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
### Run some scripts

Tweak some Mac defaults, add some dotfiles, and (optionally) remove all Dock icons (useful for a new OS install).

<br>

> :point_right: This will overwrite .aliases, .bashrc & .bash_prompt if they already exist.<br>
> :point_right: Review [macdefaults.sh](scripts/macdefaults.sh) and remove what you don't want.

<br>

Clone the repo and run the scripts:

```
git clone https://github.com/sevmorris/macback-m1.git && cd macback-m1/scripts
chmod 755 tweaks.sh
./tweaks.sh && cd ~
```

<br>

---
### Brewfile

> For practical purposes I maintain a [curated Brewfile](https://github.com/sevmorris/homebrew-brewfile.git) that lives in a Github repo. I would rather manage mas apps manually, and I definitely do not want to install every cask I have installed every time I start fresh. Strap will use this list to install my selected apps. If you're installing locally with Homebrew then you should have a look at your Brewfile and remove anything you don't want to install now, or replace it with my curated Brewfile instead.

---
To install via the local Brewfile:

```
cd ~
brew bundle install
```

For a ton of Brewfile info and tips, see [Brew Bundle Brewfile Tips](https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f). Eventually my setup will change (evolve) based on this guide.

<br>

Clean up (using one of the new aliases):

```
brewup
```

---
### Switch to new Bash

A newer version of Bash is installed via Homebrew. Time to switch to that.

> :exclamation: This is specific to M1 Macs.

```
sudo -i
echo /opt/homebrew/bin/bash >> /etc/shells
exit
chsh -s /opt/homebrew/bin/bash
```

<br>

> :point_right: **Restart** the terminal or open a new tab for the change to take effect.


---
### Cleanup

<br>

Delete the repo folder:

```
rm -r $HOME/macback
```


---
### Notes on select aliases

<details>
  <summary>audit</summary>
  <br>
  Runs a system audit using security and system auditing tool Lynis <sup>1</sup>.

</details>


<details>
  <summary>brewup</summary>
  <br>
  Updates, upgrades & cleans up Homebrew.

</details>


<details>
  <summary>cat</summary>
  <br>
  Opens a file with cat clone bat <sup>2</sup>.

</details>


<details>
  <summary>df</summary>
  <br>
  Gives an overview of the filesystem disk space usage using Disk Usage/Free utility (duf) <sup>3</sup> instead of df.

</details>


<details>
  <summary>open</summary>
  <br>
  Opens file for editing in the text editor micro <sup>4</sup> .  

</details>


<details>
  <summary>update</summary>
  <br>
  Gets macOS Software Updates (using mas <sup>5</sup>), and updates installed Ruby gems, npm, and their installed packages.

</details>


<details>
  <summary>shrug</summary>
  <br>
  Copies ¯\_(ツ)_/¯ to the clipboard

</details>

<br>

<sup>1</sup> [lynis](https://formulae.brew.sh/formula/lynis#default)<br>
<sup>2</sup> [bat](https://formulae.brew.sh/formula/bat#default)<br>
<sup>3</sup> [duf](https://formulae.brew.sh/formula/duf#default)<br>
<sup>4</sup> [micro](https://formulae.brew.sh/formula/micro#default)<br>
<sup>5</sup> [mas](https://formulae.brew.sh/formula/mas#default)


---
### Notes

Some of my dotfiles (.aliases, .bashrc, etc) live in ~/dotfiles and a [Github repo](https://github.com/sevmorris/dotfiles.git). Locally they're symlinked in ~/.<br>
My Brewfile lives in ~/homebrew-brewfile  and a [Github repo](https://github.com/sevmorris/homebrew-brewfile.git).<br>
If you run Strap and have these repos it should pull from both.


---
### Finished

It wouldn't hurt to reboot soon.

---
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

:ukraine:
