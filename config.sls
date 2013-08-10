#
# Tmux Config
#

local_tmux_conf:
  file:
    - managed
    - name: /home/vagrant/.tmux.conf
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://local_tmux/files/.tmux.conf

# Tmux Zoom
local_tmux_directory:
  file:
    - directory
    - name: /home/vagrant/.tmux
    - user: vagrant
    - group: vagrant
    - mode: 755

local_tmux_zoom:
  file:
    - managed
    - name: /home/vagrant/.tmux/tmux-zoom.sh
    - user: vagrant
    - group: vagrant
    - mode: 755
    - source: salt://local_tmux/files/tmux-zoom.sh
    - require:
      - file.directory: /home/vagrant/.tmux

local_tmux_tmuxinator_link:
  file:
    - symlink
    - name: /home/vagrant/.tmuxinator
    - target: /home/vagrant/facio/.tmuxinator
    - makedirs: True
