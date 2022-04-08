namespace :user do
  desc "Updates users data in Mailchimp"
  task update_users: :environment do
    users = User.all
    puts "Updating #{users.count} users in Mailchimp"
    users.each do |user|
      UpdateUserJob.perform_later(user.id)
    end
  end
end
namespace :user do
  desc "Update one user data in Mailchimp"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Updating #{user.email}..."
    UpdateUserJob.perform_now(user.id)
    # rake task will return when job is _done_
  end
end
