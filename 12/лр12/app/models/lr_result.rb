class LrResult < ApplicationRecord
  validates_uniqueness_of :str
  validates_presence_of :str
end
