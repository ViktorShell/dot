if status is-interactive
  # Commands to run in interactive sessions can go here
  function fish_greeting
    pfetch
    set wacom (xsetwacom --list devices)
    if test -n "$wacom"
      xsetwacom --set "Wacom One by Wacom S Pen stylus" Rotate ccw
    end
  end

  # Load tmux config
  function tmux_source
    tmux new -c "tmux source-file $HOME/.config/tmux/tmux.conf"
  end

  alias clipboard="xclip -selection clipboard"
  alias ss "systemctl suspend -i"
  alias sn "sync; shutdown now"
  alias r "ranger"
  alias nv "nvim"
  alias push "pushd ."
  alias pop "popd"
  alias tm tmux_source 
    
  export VISUAL=nvim;
  export EDITOR=nvim;
  
  # Root launch fish
  function su
   command su --shell=/usr/bin/fish $argv
  end
end
