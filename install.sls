#!stateconf yaml . jinja

#
# Installing Tmux / Tmuxinator
#

{% set dependencies = [
  "python-software-properties",
  "ruby1.9.3",
  "ruby1.9.3-dev",
  "rubygems1.9.3"] %}

{% for pkg in dependencies %}
.{{ pkg }}:
  pkg:
    - installed
{% endfor %}

# TMUX PPA for Tmux 1.8
.tmux_ppa:
  pkgrepo:
    - managed
    - ppa: chris-reeves/tmux
    - require:
      - pkg: .python-software-properties

.tmux:
  pkg:
    - installed

.tmuxinator:
  gem:
    - installed
    - require:
      - pkg: .rubygems1.9.3
