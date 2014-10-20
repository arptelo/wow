class Wonder < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true

	include PgSearch
 	pg_search_scope :search, against: [:name]

	def self.text_search(query)
		if query.present?
			search(query)
		else
			scoped
		end
	end
end