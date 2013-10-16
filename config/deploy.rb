require 'mina/git'

set :domain, ENV['NODICE_DOMAIN']
set :deploy_to, ENV['NODICE_PATH']
set :user, ENV['NODICE_USER']
set :repository, 'git@github.com:mutewinter/nodiceapp.com.git'
set :branch, 'master'
set :forward_agent, true

task :environment do
  queue %{
    echo "-----> Loading environment"
    #{echo_cmd %[source ~/.profile]}
  }
end

desc 'Deploys the current version to the server.'
task deploy: :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
  end
end
