set :application, 'datrepo'
set :deploy_user, 'deploy'

# setup repo details
set :scm, :git
set :repo_url, 'git@github.com:kcorbitt/datrepo.git'
set :deploy_subdir, "site"

# setup rbenv.
# set :rbenv_type, :system
# set :rbenv_ruby, '2.0.0-p0'
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}

# how many old releases do we want to keep
set :keep_releases, 5

# files we want symlinking to specific entries in shared.
set :linked_files, %w{config/database.yml config/secrets.yml}

# dirs we want symlinking to shared
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# what specs should be run before deployment is allowed to
# continue, see lib/capistrano/tasks/run_tests.cap
set :tests, ["spec"]

# # which config files should be copied by deploy:setup_config
# # see documentation in lib/capistrano/tasks/setup_config.cap
# # for details of operations
# set(:config_files, %w(
#   unicorn_init.sh
# ))

# # which config files should be made executable after copying
# # by deploy:setup_config
# set(:executable_config_files, %w(
#   unicorn_init.sh
# ))

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc.
set(:symlinks, [
  # {
  #   source: "unicorn_init.sh",
  #   link: "/etc/init.d/unicorn_#{fetch(:full_app_name)}"
  # }
  # {
  #   source: "log_rotation",
  #  link: "/etc/logrotate.d/#{fetch(:full_app_name)}"
  # },
  # {
  #   source: "monit",
  #   link: "/etc/monit/conf.d/#{fetch(:full_app_name)}.conf"
  # }
])

set :log_level, :info

# this:
# http://www.capistranorb.com/documentation/getting-started/flow/
# is worth reading for a quick overview of what tasks are called
# and when for `cap stage deploy`

namespace :deploy do
  # make sure we're deploying what we think we're deploying
  before :deploy, "deploy:check_revision"
  # only allow a deploy with passing tests to deployed
  # before :deploy, "deploy:run_tests"
  # compile assets locally then rsync
  after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :finishing, 'deploy:cleanup'

  after :publishing, 'unicorn:restart'
end
