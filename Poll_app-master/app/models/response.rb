# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  voter_id         :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord 
  validate :not_duplicate_response
  
  
  belongs_to :respondent, 
  primary_key: :id, 
  foreign_key: :voter_id,
  class_name: 'User'
  
  belongs_to :answer_choice, 
  primary_key: :id, 
  foreign_key: :answer_choice_id,
  class_name: 'AnswerChoice'
  
  has_one :question,
  through: :answer_choice,
  source: :question
  
  
  def sibling_responses
    question.responses.where.not(id: self.id)
  end 
  
  def respondent_already_answered?
    self.sibling_responses.exists?(voter_id: self.voter_id)
  end
  
  private
  
  def not_duplicate_response 
    if respondent_already_answered?
      errors[:duplicate_response] << 'You already responded!'
    end
  end 
   

  
  
end 
