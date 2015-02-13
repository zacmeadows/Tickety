class Ticket < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true



  def user_first_name 
    user.first_name if user
  end

end
