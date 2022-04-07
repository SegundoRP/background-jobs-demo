class FakeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Doing something time expesive"
    sleep 3
    puts "done"
  end
end
