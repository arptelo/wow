class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :wonder
  validates :user_id, :wonder_id, presence: true
end