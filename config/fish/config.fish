if status is-interactive
  # Commands to run in interactive sessions can go here
  function fish_greeting
    pfetch
  end

  alias clipboard="xclip -selection clipboard"
  alias ss "systemctl suspend -i"
  alias sn "shutdown now"
  alias r "ranger"
    
  export VISUAL=nvim;
  export EDITOR=nvim;
  
  # Root launch fish
  function su
   command su --shell=/usr/bin/fish $argv
  end
end
