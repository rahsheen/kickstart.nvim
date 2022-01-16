
if [ ! -f $HOME/antigen/antigen.zsh ]; then
    cat <<EOF
    Antigen not installed!

    git clone https://github.com/zsh-users/antigen.git ~/antigen
EOF
else
    source "$HOME/antigen/antigen.zsh"

    antigen bundle zsh-users/zsh-autosuggestions
    antigen use oh-my-zsh
    antigen bundle arialdomartini/oh-my-git
    antigen theme arialdomartini/oh-my-git-themes oppa-lana-style
    antigen apply
fi

alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

if [ ! -f ~/.fzf.zsh ]; then 
    cat<<EOF 
    FZF Not installed!

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
EOF
else
    source ~/.fzf.zsh
fi

if [ ! type rvm &> /dev/null ]; then
cat<<EOF
RVM Not installed. You should probably do this:

mkdir -p ~/.rvm/src && cd ~/.rvm/src && rm -rf ./rvm && \
git clone --depth 1 https://github.com/rvm/rvm.git && \
cd rvm && ./install
EOF
else
    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    PATH="$PATH:$HOME/.rvm/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH
