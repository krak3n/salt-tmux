#
# Installing Tmux / Tmuxinator
#

local_tmux_install:
  pkg:
    - installed
    - name: tmux

local_tmux_rubygems_install:
  pkg:
    - installed
    - name: rubygems

local_tmux_tmuxinator_install:
  gem:
    - installed
    - name: tmuxinator
    - require:
      - pkg: local_tmux_rubygems_install
