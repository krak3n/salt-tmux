#!stateconf yaml . jinja

#
# Tmux Config
#

.tmux_config:
  file:
    - managed
    - name: /home/vagrant/.tmux.conf
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://local_tmux/files/.tmux.conf

.tmux_local_config:
  file:
    - managed
    - name: /home/vagrant/.tmux.local.conf
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://local_tmux/files/.tmux.local.conf

# Tmux Zoom
.tmux_directory:
  file:
    - directory
    - name: /home/vagrant/.tmux
    - user: vagrant
    - group: vagrant
    - mode: 755

.tmux_zoom:
  file:
    - managed
    - name: /home/vagrant/.tmux/tmux-zoom.sh
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://local_tmux/files/tmux-zoom.sh
    - require:
      - file: .tmux_directory
