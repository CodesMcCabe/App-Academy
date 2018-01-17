# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :subs, :author, presence: true
  
  belongs_to :author,
    class_name: :User,
    foreign_key: :author_id
    
  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs
  
  has_many :comments
  
  def comments_by_parent_id
    comments_hash = Hash.new { |h,k| h[k] = [] }
    
    self.comments.each do |comment|
      comments_hash[comment.parent_comment_id] << comment
    end
    
    comments_hash
  end
end
