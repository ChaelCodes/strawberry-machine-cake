# frozen_string_literal: true

# Controller to handle routing for Pixes.
# Create and update route to the character or scenario of the pix.
class PixesController < ApplicationController
  before_action :set_pix, only: %i[show edit update destroy]
  before_action :build_pix, only: %i[new create]

  # GET /pixs
  # GET /pixs.json
  def index
    @pixs = Pix.all
  end

  # POST /pixes
  # POST /pixes.json
  def create
    respond_to do |format|
      @pix.images.attach(params[:images]) if params[:images]
      if @pix.save
        format.html do
          redirect_to go_to_pix(@pix),
                      flash: { success: 'Pix was successfully saved.' }
        end
        format.json { render :show, status: :created, location: @pix }
      else
        format.html { render :new }
        format.json { render json: @pix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pixes/1
  # PATCH/PUT /pixes/1.json
  def update
    respond_to do |format|
      @pix.images.attach(params[:images]) if params[:images]
      if @pix.update(pix_params)
        format.html do
          redirect_to go_to_pix(@pix),
                      flash: { success: 'Pix was successfully saved.' }
        end
        format.json { render :show, status: :ok, location: @pix }
      else
        format.html { render :edit }
        format.json { render json: @pix.errors, status: :unprocessable_entity }
      end
    end
  end

  def restful_object
    RestfulObject.new(@pix,
                      params[:pix] && pix_params,
                      pixes_url)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pix
    @pix = Pix.find(params[:id])
  end

  def build_pix
    @pix = params['pix'] ? Pix.new(pix_params) : Pix.new
  end

  # Never trust parameters from the internet, only allow the white list through.
  def pix_params
    params.require(:pix).permit(:character_id, :scenario_id, :msg, images: [])
  end

  def go_to_pix(pix)
    if pix.scenario
      scenario_path pix.scenario,
                    anchor: "pix-#{pix.id}",
                    params: { character_id: pix.character.id }
    else
      character_path pix.character, anchor: "pix-#{pix.id}"
    end
  end
end
