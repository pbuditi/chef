default['erlang']['gui_tools'] = false
default['erlang']['install_method'] = 'package'

default['erlang']['source']['version'] = '18.3'
default['erlang']['source']['checksum'] = 'fdab8129a1cb935db09f1832e3a7d511a4aeb2b9bb3602ca6a7ccb9730d5c9c3'
default['erlang']['source']['build_flags'] = ''
default['erlang']['source']['cflags'] = ''

default['erlang']['esl']['version'] = nil
default['erlang']['esl']['lsb_codename'] = node['lsb'] ? node['lsb']['codename'] : 'no_lsb'