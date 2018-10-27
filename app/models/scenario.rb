class Scenario < ApplicationRecord
    has_many :pixes
    validates :name, uniqueness: true
end
