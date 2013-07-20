#
# Tmux Config
#

chris_tmux_conf:
  file:
    - managed
    - name: /home/vagrant/.tmux.conf
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://chris_tmux/files/.tmux.conf

# Tmux Zoom
chris_tmux_directory:
  file:
    - directory
    - name: /home/vagrant/.tmux:
    - user: vagrant
    - group: vagrant
    - mode: 755

chris_tmux_zoom:
  file:
    - managed
    - name: /home/vagrant/.tmux/tmux-zoom.sh
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://chris_tmux/files/tmux-zoom.sh
    - require:
      - file.directory: /home/vagrant/.tmux
