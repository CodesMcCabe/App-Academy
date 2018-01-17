  # == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :string           not null
#  moderator   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :moderator, :description, presence: true
  
  belongs_to :mod,
    class_name: :User,
    foreign_key: :moderator
  
  has_many :post_subs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :post_subs
end
