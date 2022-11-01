class CostsManagement < ApplicationRecord
  validates :costsfile, presence: true  
  mount_uploader :cost_file, ImageUploader
end
