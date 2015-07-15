class DataFile < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  mount_uploader :csv_file, CsvFileUploader
end
