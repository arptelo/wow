class Checkpoint < ActiveRecord::Base
  belongs_to :route
  belongs_to :wonder
end
