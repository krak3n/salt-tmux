#
# Installing Tmux / Tmuxinator
#

chris_tmux_install:
  pkg:
    - installed
    - name: tmux

chris_tmux_rubygems_install:
  pkg:
    - installed
    - name: rubygems

chris_tmux_tmuxinator_install:
  gem:
    - installed
    - name: tmuxinator
    - require:
      - pkg: chris_tmux_rubygems_install
