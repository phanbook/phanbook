# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'forum'
set :repo_url, 'git@github.com:duythien/forum.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/usr/share/nginx/html/forum'
set :log_path,  '/var/log/forum'

# Default value for :scm is :git
set :scm, :git
set :branch,        'master'

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true
#Set option for slack
set :server_name, 'phalcontip.com'
set :slack_webhook, -> { nil }
set :slack_icon_url,         -> { 'http://gravatar.com/avatar/885e1c523b7975c4003de162d8ee8fee?r=g&s=40' }
set :slack_icon_emoji,       -> { ":)" } # will override icon_url, Must be a string (ex: ':shipit:')
#set :slack_channel,          -> { '#general' }
set :slack_channel_starting, -> { nil } # Channel to post to. Optional. Defaults to :slack_channel.
set :slack_channel_finished, -> { nil } # Channel to post to. Optional. Defaults to :slack_channel.
set :slack_channel_failed,   -> { nil } # Channel to post to. Optional. Defaults to :slack_channel.
#set :slack_username,         -> { '@duythien' }
set :slack_run_starting,     -> { true }
set :slack_run_finished,     -> { true }
set :slack_run_failed,       -> { true }
set :slack_msg_starting,     -> { "#{ENV['USER'] || ENV['USERNAME']} has started deploying branch #{fetch :branch} of #{fetch :application} to #{fetch :server_name, 'production'} :rocket:" }
set :slack_msg_finished,     -> { "#{ENV['USER'] || ENV['USERNAME']} has finished deploying branch #{fetch :branch} of #{fetch :application} to #{fetch :server_name, 'production'} :star2:" }
set :slack_msg_failed,       -> { "#{ENV['USER'] || ENV['USERNAME']} failed to deploy branch #{fetch :branch} of #{fetch :application} to #{fetch :server_name, 'production'}" }
set :slack_title_starting,   -> { nil }
set :slack_title_finished,   -> { nil }
set :slack_title_failed,     -> { nil }
# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end
  # Rake::Task["deploy:check:directories"].clear
  # namespace :check do
  #   desc '(overwrite) Setup log directories'
  #   task :directories do
  #     on release_roles :all do
  #       execute :sudo, :chmod, '777', "/var/log"
  #       execute :sudo, :mkdir, '-pv', shared_path, releases_path
  #       execute :sudo, :chown, "#{fetch(:user)}:#{fetch(:group)}", deploy_to
  #       execute :sudo, :chown, "#{fetch(:user)}:#{fetch(:group)}", shared_path
  #       execute :sudo, :chown, "#{fetch(:user)}:#{fetch(:group)}", releases_path
  #       execute :mkdir, '-pv', "#{fetch(:log_path)}"
  #       execute :chmod, '777', "#{fetch(:log_path)}"
  #     end
  #   end
  # end
  #before 'deploy', 'slack:started'
	#after 'deploy', 'slack:finished'
end