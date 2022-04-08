class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    # Do something later
    user = User.find(user_id)
    puts "Updating #{user.email} data in Mailchimp"
    sleep 3
    puts "done"
  end
end
