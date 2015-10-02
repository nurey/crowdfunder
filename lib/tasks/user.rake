namespace :user do 
  desc "Prints out last 10 created users" 
  task :most_recent_ten => [:environment] do
    User.order(created_at: :desc).last(10).each do |u|
      puts(u.email)
    end
  end

  desc ""
  task :oldest_ten ...
end