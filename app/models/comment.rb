class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :wonder
	default_scope -> { order('created_at DESC') }
	validates :user_id, :wonder_id, presence: true
end