class PropertyTag < ActiveRecord::Base
	has_many :best_tags
	has_many :wonder_types, through: :best_tags
end
