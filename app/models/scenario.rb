class Scenario < ApplicationRecord
    has_many :pixes
    has_and_belongs_to_many :characters
    validates :name, presence: true
end
