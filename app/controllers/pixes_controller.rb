class PixesController < ApplicationController
  before_action :set_pix, only: [:show, :edit, :update, :destroy]

  # GET /pixs
  # GET /pixs.json
  def index
    @pixs = Pix.all
  end

  # GET /pixes/1
  # GET /pixes/1.json
  def show
  end

  # GET /pixes/new
  def new
    @pix = Pix.new
  end

  # GET /pixes/1/edit
  def edit
  end

  # POST /pixes
  # POST /pixes.json
  def create
    @pix = Pix.new(pix_params)

    respond_to do |format|
      if @pix.save
        format.html { redirect_to @pix, notice: 'pix was successfully created.' }
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
      if @pix.update(pix_params)
        format.html { redirect_to @pix, notice: 'pix was successfully updated.' }
        format.json { render :show, status: :ok, location: @pix }
      else
        format.html { render :edit }
        format.json { render json: @pix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pixes/1
  # DELETE /pixes/1.json
  def destroy
    @pix.destroy
    respond_to do |format|
      format.html { redirect_to pixs_url, notice: 'pix was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pix
      @pix = Pix.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pix_params
      params.require(:pix).permit(:character_id, :msg)
    end
end
