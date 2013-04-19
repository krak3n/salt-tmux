#!py


import os


def tmux():
    return {
        'tmux': {'pkg': ['installed']}
    }


def rubygems():
    return {
        'rubygems': {'pkg': ['installed']}
    }


def tmuxconfig():
    return {
        '/home/vagrant/.tmux.conf': {
            'file': ['managed',
                     {'user': 'vagrant'},
                     {'group': 'vagrant'},
                     {'mode': 755},
                     {'source': 'salt://dev_tmux/files/.tmux.conf'},
                     {'require': [{'pkg': 'tmux'}]}]
        }
    }


def tmuxinator():
    return {
        'tmuxinator': {
            'gem': ['installed', {'require': [{'pkg': 'rubygems'}]}]
        }
    }


def tmuxinator_directories():
    return {
        '/home/vagrant/.tmuxinator/': {
            'file': ['directory',
                     {'user': 'vagrant'},
                     {'group': 'vagrant'},
                     {'makedirs': True}]
        }
    }


def tmuxinator_config():
    """
    Use default tmuxinator yaml file of project alternative does not exist.
    """

    project_name = pillar.get('project_name')
    if project_name:
        source = 'salt://dev_tmux/files/default.yml'
        path = os.path.join('/', 'home', 'vagrant', '.salt-dev', 'states',
                            'dev_tmux', 'files', 'tmuxinator',
                            '{0}.yml'.format(project_name))
        if os.path.isfile(path):
            source = 'salt://dev_tmux/files/tmuxinator/{0}.yml'.format(project_name)
        return {
            '/home/vagrant/.tmuxinator/{0}.yml'.format(project_name): {
                'file': ['managed',
                         {'user': 'vagrant'},
                         {'group': 'vagrant'},
                         {'mode': 755},
                         {'source': source},
                         {'template': 'jinja'},
                         {'require': [
                             {'file.directory': '/home/vagrant/.tmuxinator/'}
                         ]}]
            }
        }
    return {}


def run():
    return dict((tmux().items() +
                 rubygems().items() +
                 tmuxconfig().items() +
                 tmuxinator().items() +
                 tmuxinator_directories().items() +
                 tmuxinator_config().items()))
