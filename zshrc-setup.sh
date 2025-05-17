#!/bin/bash

set -e

REPO_DIR="$HOME/dotfiles-zsh"
PLUGINS_DIR="$REPO_DIR/zsh/custom/plugins"

mkdir -p "$PLUGINS_DIR"

echo "📁 Creating Zsh dotfiles repo at $REPO_DIR"

# Copy .zshrc and .p10k.zsh if exists
cp "$HOME/.zshrc" "$REPO_DIR/.zshrc"
[ -f "$HOME/.p10k.zsh" ] && cp "$HOME/.p10k.zsh" "$REPO_DIR/.p10k.zsh"

echo "🔌 Cloning plugins..."

git clone https://github.com/zsh-users/zsh-autosuggestions "$PLUGINS_DIR/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$PLUGINS_DIR/zsh-syntax-highlighting"
git clone https://github.com/Aloxaf/fzf-tab "$PLUGINS_DIR/fzf-tab"

echo "🛠️ Writing install.sh script..."
cat > "$REPO_DIR/install.sh" <<'EOF'
#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

echo "📦 Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "🔗 Symlinking config files..."
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
[ -f "$DOTFILES_DIR/.p10k.zsh" ] && ln -sf "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

echo "🔌 Installing custom plugins..."
mkdir -p "$ZSH_CUSTOM/plugins"
for plugin in zsh-autosuggestions zsh-syntax-highlighting fzf-tab; do
  [ -e "$ZSH_CUSTOM/plugins/$plugin" ] && rm -rf "$ZSH_CUSTOM/plugins/$plugin"
  ln -s "$DOTFILES_DIR/zsh/custom/plugins/$plugin" "$ZSH_CUSTOM/plugins/$plugin"
done

echo "🎯 Setting Zsh as default shell..."
chsh -s "$(which zsh)"

echo "✅ Done! Start a new terminal or run: source ~/.zshrc"
EOF

chmod +x "$REPO_DIR/install.sh"

echo "✅ Repo ready at: $REPO_DIR"
echo "📝 Next steps:"
echo "  cd $REPO_DIR"
echo "  git init && git remote add origin <your-github-repo-url>"
echo "  git add . && git commit -m 'initial zsh setup' && git push -u origin main"

