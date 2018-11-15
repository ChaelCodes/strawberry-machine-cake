module CharacterHelper
  def chara_params(character)
    { 'character': {
        'display_name': character.display_name,
        'handle': character.handle,
        'color': character.color,
        'previous_character_id': character.id
      }
    }
  end
end
