# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord 
  
  validates :username, uniqueness: true , presence: true  
  
  
  has_many :authored_polls,
     primary_key: :id,
     foreign_key: :poll_id,
     class_name: 'Poll'
  
  
     has_many :responses,
      primary_key: :id,
      foreign_key: :voter_id,
      class_name: 'Response'
  
end 
