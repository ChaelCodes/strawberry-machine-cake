class Character < ApplicationRecord
  has_many :pixes
  has_many :likes
  belongs_to :previous_character, class_name: 'Character'

  has_one_attached :avatar

  def deactivate
    update(state: 'inactive')
  end
end
