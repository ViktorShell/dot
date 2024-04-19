if status is-interactive
  # Commands to run in interactive sessions can go here
  function fish_greeting
    pfetch
  end

  # Load tmux config
  function tmux_source
    tmux new -c "tmux source-file $HOME/.config/tmux/tmux.conf"
  end

  # Zathura
  function zath
    zathura $argv[1] &> /dev/null & disown
  end

  alias clipboard="xclip -selection clipboard"
  alias ss "systemctl suspend -i && i3lock -i $HOME/.config/i3/wallpaper/ocean.png"
  alias sn "sync; shutdown now"
  alias r "ranger"
  alias ls "exa"
  alias zt zath
  alias nv "nvim"
  alias push "pushd ."
  alias pop "popd"
  alias screen "flameshot gui"
  alias tm tmux_source 
    
  export VISUAL=nvim;
  export EDITOR=nvim;
  
  # Root launch fish
  function su
   command su --shell=/usr/bin/fish $argv
  end
end
