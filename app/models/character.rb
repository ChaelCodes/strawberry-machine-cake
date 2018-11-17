class Character < ApplicationRecord
  has_many :pixes
  has_many :likes
  belongs_to :previous_character, class_name: 'Character', optional: true
  has_one :next_character, class_name: 'Character', foreign_key: :previous_character_id
  has_and_belongs_to_many :scenarios

  has_one_attached :avatar

  scope :active, -> { where(state: 'active') }

  def name_and_version
    "#{display_name} #{version}"
  end

  def deactivate
    update(state: 'inactive')
  end
end
