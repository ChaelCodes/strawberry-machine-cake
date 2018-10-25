class Character < ApplicationRecord
    has_many :pixes
    has_many :likes
    has_one_attached :avatar
end
