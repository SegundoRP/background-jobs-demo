class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_commit :mailchimp_sync

  private

  def mailchimp_sync
    UpdateUserJob.perform_later(self.id)
  end
end
