# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.16.0'

set :application, 'theblog'
set :repo_url, 'git@github.com:AndrewKrasnoff/theblog.git'
set :branch, 'main'
set :keep_releases, 2

append :linked_files, 'config/database.yml', 'config/secrets.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

set :deploy_to, "/home/deploy/www/#{fetch :application}"
