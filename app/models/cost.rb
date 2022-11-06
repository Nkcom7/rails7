class Cost < ApplicationRecord
    belongs_to :costs_management
    has_many :cost_details
end
