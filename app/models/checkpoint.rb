class Checkpoint < ActiveRecord::Base
  belongs_to :travel
  belongs_to :wonder
end
