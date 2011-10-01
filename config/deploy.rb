# Integração com o Bundler
require "bundler/capistrano"

# Integração com RVM
# mais informações: http://beginrescueend.com/integration/capistrano/
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.2'

# Nome da aplicação
set :application, "rockandrails"

# Repositório
set :scm, :git
set :repository,  "git@github.com:leohackin/rar_rspec.git"
set :branch, "master"

# Saída verbosa (muuuuuita mensagem no console)
set :scm_verbose, true

# Manter até 5 releases no servidor
set :keep_releases, 5

# Para trabalhar com chaves SSH
ssh_options[:forward_agent] = true

# Não usar sudo
set :use_sudo, false

# Usuário utilizado para deploy (deve ser um usuário válido no servidor)
set :user, "m3nd3s"

# Path onde será implantada (deploy) da aplicação
set :deploy_to, "/home/m3nd3s/rockandrails"

# Servidores utilizados para deploy
# Mais informações em: https://github.com/capistrano/capistrano/wiki/Roles
role :web, "rockandrails.almirmendes.com"
role :app, "rockandrails.almirmendes.com"
role :db,  "rockandrails.almirmendes.com", :primary => true

#
# Triggers Tasks
#
before 'deploy:symlink', 'deploy:assets'
after 'deploy:symlink', 'deploy:rvmrc', 'deploy:database', 'deploy:migrate', 'deploy:restart'

# Custom tasks and overrides
namespace :deploy do
  desc "Compile asets"
  task :assets do
    run "cd #{release_path}; RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
  end

  desc "Copy pre configured database.yml"
  task :database, :roles => :app do
    run "cp #{deploy_to}/shared/database.yml #{current_path}/config/"
  end

  desc "Remove unnecessary .rvmrc"
  task :rvmrc, :roles => :app do
    run "rm -f #{current_path}/.rvmrc"
  end
end
