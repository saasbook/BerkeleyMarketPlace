namespace :db do
  namespace :test do
    task :prepare => :environment do
      ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['test'])
      Rake::Task["db:seed"].invoke
    end
  end
end