class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update destroy]
  before_action :build_character, only: %i[new create]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.active
  end

  # POST /characters
  # POST /characters.json
  def create
    if @character.save
      character.avatar.attach(params[:avatar]) if params[:avatar]
    end
    respond_to_save
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    if @character.update(character_params)
      character.avatar.attach(params[:avatar]) if params[:avatar]
    end
    respond_to_save
  end

  def restful_object
    RestfulObject.new(@character,
                      params[:character] && character_params,
                      characters_url)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  def build_character
    @character = params['character'] ? Character.new(character_params) : Character.new
  end

  # Never trust parameters from the internet, only allow the white list through.
  def character_params
    params.require(:character)
          .permit(:display_name, :handle, :color, :avatar, :previous_character_id)
  end
end
