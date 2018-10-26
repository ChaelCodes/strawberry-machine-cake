class Pix < ApplicationRecord
    belongs_to :character
    has_many_attached :images
    validates :msg, presence: true
    delegate :color, to: :character
end
