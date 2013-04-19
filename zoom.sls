#
# Tmux Zoom - Pane Maximisation
#

/home/vagrant/.tmux:
  file:
    - directory
    - user: vagrant
    - group: vagrant
    - dir_mode: 755
    - file_mode: 755
    - require:
      - pkg: tmux

/home/vagrant/.tmux/tmux-zoom.sh:
  file:
    - managed
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://dev_tmux/files/tmux-zoom.sh
    - require:
      - file.directory: /home/vagrant/.tmux
