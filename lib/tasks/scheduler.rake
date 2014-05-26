desc "This task is called by the Heroku scheduler add-on"
task :daily_update => :environment do
  User.daily_update
end