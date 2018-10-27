class Pix < ApplicationRecord
    belongs_to :character
    belongs_to :scenario, optional: true
    has_many_attached :images
    validates :msg, presence: true

    scope :without_scenario, -> { where(scenario_id: nil) }
end
