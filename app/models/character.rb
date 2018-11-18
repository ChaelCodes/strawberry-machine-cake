# frozen_string_literal: true

##
# A character writes pixes, and styles them.
# The pix heading color comes from the character.
# Display name is the character's name
# Handle is the twitter style handle used to refer to the character.
class Character < ApplicationRecord
  # Associations
  has_many :pixes
  has_many :likes
  belongs_to :previous_character, class_name: 'Character', optional: true
  has_one :next_character, class_name: 'Character', foreign_key: :previous_character_id
  has_and_belongs_to_many :scenarios
  # Uses ActiveStorage
  has_one_attached :avatar

  # Callbacks
  after_commit :deactivate_previous_character, on: :create

  # Scopes
  scope :active, -> { where(state: 'active') }

  # Validations
  validates :state, inclusion: { in: %w[active inactive] }

  # Instance Methods

  ##
  # Deactivate characters so they no longer show on the index page
  # Deactivated characters are still visible and available around the app
  # Pixes can still be created for deactivate characters
  def deactivate
    update(state: 'inactive')
  end

  ##
  # When we iterate on a character, we only want to show
  # one character in the index list, so deactivate the old one
  def deactivate_previous_character
    previous_character&.deactivate
  end

  ##
  # Used in dropdowns to differentiate between characters
  def name_and_version
    [display_name, version].compact.join(' ')
  end
end
