set fish_greeting
set -x EDITOR 'emacsclient -t'
set -x GIT_EDITOR $EDITOR
set -U fish_user_paths ~/.local/bin ~/bin ~/bin/go/bin /usr/local/bin $fish_user_paths
set -x ALTERNATE_EDITOR "" # Start emacs in every case!
set -x WORKLOG /home/bascht/Documents/Freelance/Worklog/Worklog.md
set -x Documents /home/bascht/Documents
set -x Code $Documents/Code

# I need dis
set emflip '(╯°□°)╯︵ ┻━┻'
set emwhy 'џ(ºДºџ)'
set emshrug '¯\_(ツ)_/¯'
set emshrugdis '¯\_ಠ_ಠ_/¯'
set emdis 'ಠ_ಠ'

# Aliases
alias va "vagrant"
alias tm "tmux -2"
alias ta "tm a -t"
alias bi "bundle install"
alias be "bundle exec"
alias ber "bundle exec rake"
alias e $EDITOR
alias vi $EDITOR #going emacs
alias vim $EDITOR
alias er "e --eval '(writeroom-mode)'"
alias dvm "cd ~/DevVM; and vagrant ssh -- -A"
alias ssh-yop "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias docker-rm-stopped "docker rm (docker ps -a -q)"
alias docker-rm-dangling "docker rmi (docker images -q -f dangling=true)"
alias dco "docker-compose"

# Manually switch HIDPI
function scale
    /usr/bin/gsettings set org.gnome.desktop.interface scaling-factor $argv;
    /usr/bin/gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gdk/WindowScalingFactor': <$argv>}";
    if math "$argv == 1"
            /usr/bin/xrandr --dpi 96
    else
            /usr/bin/xrandr --dpi 144
    end
end

# Fire up RVM
set -e GEM_PATH; set -e GEM_HOME

# Fishmarks
. ~/.fishmarks/marks.fish

# Host-specific .vagrant directories
set -x VAGRANT_DOTFILE_PATH .vagrant-(hostname -s)

# Color Git Prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_showcolorhints 1
