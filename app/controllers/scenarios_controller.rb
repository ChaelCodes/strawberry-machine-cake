class ScenariosController < ApplicationController
  before_action :set_scenario, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :build_scenario, only: %i[new create]

  # GET /scenarios
  # GET /scenarios.json
  def index
    @scenarios = Scenario.all
  end

  def restful_object
    RestfulObject.new(@scenario,
                      params[:scenario] && scenario_params,
                      scenarios_url)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_scenario
    @scenario = Scenario.find(params[:id])
  end

  # Build a scenario
  def build_scenario
    @scenario = params['scenario'] ? Scenario.new(scenario_params) : Scenario.new
  end

  # Never trust parameters from the internet, only allow the white list through.
  def scenario_params
    params.require(:scenario).permit(:name, character_ids: [])
  end
end
