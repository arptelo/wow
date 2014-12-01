class WonderType < ActiveRecord::Base
	has_many :wonders
	has_many :best_tags
	has_many :property_tags, through: :best_tags
end
