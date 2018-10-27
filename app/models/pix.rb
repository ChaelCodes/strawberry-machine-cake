class Pix < ApplicationRecord
    belongs_to :character
    belongs_to :scenario
    has_many_attached :images
    validates :msg, :character_id, presence: true

    scope :without_scenario, -> { where(scenario_id: nil) }
end
