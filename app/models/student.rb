class Student < ActiveRecord::Base
  belongs_to :dojo

  validates :first_name, :last_name_, :email, :dojo, presence: true
  
end
