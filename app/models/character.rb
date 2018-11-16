class Character < ApplicationRecord
  has_many :pixes
  has_many :likes
  belongs_to :previous_character, class_name: 'Character', optional: true
  has_one :next_character, class_name: 'Character', foreign_key: :previous_character_id

  has_one_attached :avatar

  scope :active, -> { where(state: 'active') }

  def deactivate
    update(state: 'inactive')
  end
end
