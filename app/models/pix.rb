class Pix < ApplicationRecord
    belongs_to :character
    validates :msg, presence: true
end
