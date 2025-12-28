# 🏠 dotfiles

My personal dotfiles, managed using [GNU Stow](https://www.gnu.org/software/stow/).  
Each directory within this repository represents a configuration “package” and is
symlinked into `$HOME` or `$XDG_CONFIG_HOME` as appropriate.

---

## 📦 Requirements

- **Git**
- **GNU Stow**
- A Unix-like operating system (Linux or macOS)

### Installing Stow

#### macOS (Homebrew)
```bash
brew install stow
```

#### Debian/Ubuntu
```bash
sudo apt install stow
```

#### Arch Linux
```bash
sudo pacman -S stow
```

---

## 🚀 Installing the dotfiles

Clone the repository, ideally into `$HOME/dotfiles`:

```bash
git clone git@github.com:mgierok/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Then activate whichever configuration packages you wish to use, for example:

```bash
stow -vt ~ nvim
```

or:

```bash
stow -vt ~ git
```

This will create symbolic links such as:
```
~/.config/nvim  → ~/dotfiles/nvim/.config/nvim
~/.gitconfig    → ~/dotfiles/git/.gitconfig
```

---

## 📂 Repository structure
```
dotfiles/
  nvim/
    .config/nvim/...
  git/
    .gitconfig
```

Each directory corresponds to a package that may be activated individually:

```bash
stow -vt ~ nvim git
```

---

## 🔄 Updating configuration

Edit files as you normally would within `~/.config/...` —  
because they are symbolic links, changes are written directly into `~/dotfiles`.

---

## 🧹 Removing a package

To remove a configuration package and its links:

```bash
cd ~/dotfiles
stow -Dvt ~ nvim
```

---

## ✨ Tips

- To add a new package, for example `zsh/`:
  ```bash
  mkdir -p ~/dotfiles/zsh
  # place your .zshrc inside
  stow -vt ~ zsh
  ```

- When setting up a new machine:
  clone the repository → install `stow` → `stow <package>`  
  and your configuration is restored within seconds.

---

## 📜 Licence

Feel free to use and adapt. No warranty provided.
