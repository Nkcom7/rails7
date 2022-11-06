class CostsManagement < ApplicationRecord
  validates :cost_file, presence: true  
  mount_uploader :cost_file, ImageUploader
  has_many :costs
end
