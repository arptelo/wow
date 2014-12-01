class BestTag < ActiveRecord::Base
  belongs_to :wonder_type
  belongs_to :property_tag
end
