#!/bin/bash
set -e

echo "📦 Unzipping zsh-config.zip..."
unzip -o zsh-config.zip -d "$HOME"

echo "🔗 Linking .zshrc and .p10k.zsh..."
mv -f "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%s)" 2>/dev/null || true
mv -f "$HOME/.p10k.zsh" "$HOME/.p10k.zsh.backup.$(date +%s)" 2>/dev/null || true

cp -f "$HOME/.zshrc" "$HOME"
[ -f "$HOME/.p10k.zsh" ] && cp -f "$HOME/.p10k.zsh" "$HOME"

echo "🔄 Moving .oh-my-zsh to home directory..."
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Backing up existing .oh-my-zsh"
    mv "$HOME/.oh-my-zsh" "$HOME/.oh-my-zsh.backup.$(date +%s)"
fi
cp -r "$HOME/.oh-my-zsh" "$HOME"

echo "✅ Setup complete! Restart your terminal or run: source ~/.zshrc"

