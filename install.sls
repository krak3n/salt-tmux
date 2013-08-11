#!stateconf yaml . jinja

#
# Installing Tmux / Tmuxinator
#

# Tmux

.python-software-properties:
  pkg:
    - installed

.tmux_ppa:
  pkgrepo:
    - managed
    - ppa: chris-reeves/tmux
    - require:
      - pkg: .python-software-properties

.tmux:
  pkg:
    - installed

# Tmuxinator - Requires ruby >= 1.9.3

.rbenv-deps:
  pkg:
    - installed
    - names:
      - bash
      - git
      - openssl
      - curl

.ruby-1.9.3-p448:
  rvm:
    - installed
    - default: True
    - require:
      - pkg: .rbenv-deps

.tmuxinator:
  gem:
    - installed
    - require:
      - rvm: .ruby-1.9.3-p448
