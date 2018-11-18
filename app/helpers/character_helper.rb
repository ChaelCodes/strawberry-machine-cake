module CharacterHelper
  # This method provides the parameters used to iterate on
  # an existing character. Iterating on a character initializes
  # a new character with the same params as the old, and
  # it can then be modified. The old character, and the styling
  # it applied to the Pix is preserved.
  # Previous character id allows us to connect the new character
  # with the old.
  def iterate_chara_params(character)
    { 'character': {
        'display_name': character.display_name,
        'handle': character.handle,
        'color': character.color,
        'previous_character_id': character.id,
        'version': 1 + (character.version || 1)
      }
    }
  end
end
