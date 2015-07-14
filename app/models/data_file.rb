class DataFile < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
end
