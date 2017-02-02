### >>> Installing Oh My ZSH!

echo "\n>>> Installing Oh My ZSH!"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "\nOh My ZSH! installed <<<"

### <<<

### >>> Generation .zshrc

echo "\n>>> Generating .zshrc"

sed "s/whoami/$(whoami)/g" dots/.zshrc > dots/.zshrc-copy

mv dots/.zshrc-copy ~/.zshrc

echo "\n.zshrc generated <<<"

### <<<