# frozen_string_literal: true

# Defines a default specification for a restful controller.
# All changes here are applied to every controller.
class ApplicationController < ActionController::Base
  # Specification for using default methods #
  RestfulObject = Struct.new(:obj, :params, :index_url) do
    def name
      obj.class.to_s
    end
  end

  # Supply an object from your subclass controller in this method,
  # and the default controller actions will be provided.
  def restful_object
    # RestObject.new()
  end

  # Free Methods #

  # POST /things
  # POST /things.json
  def create
    restful_object.obj.save
    respond_to_save
  end

  def respond_to_save
    respond_to do |format|
      if restful_object.obj.valid?
        process_save_success format
      else
        process_save_error format
      end
    end
  end

  def process_save_success(format)
    format.html do
      redirect_to restful_object.obj,
                  flash: { success: "#{restful_object.name} was successfully saved." }
    end
    format.json { render :show, status: :created, location: restful_object.obj }
  end

  def process_save_error(format)
    format.html { render :new }
    format.json { render json: restful_object.obj.errors, status: :unprocessable_entity }
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    restful_object.obj.destroy
    respond_to_destroy
  end

  def respond_to_destroy
    respond_to do |format|
      format.html do
        redirect_to restful_object.index_url,
                    flash: {
                      success: "#{restful_object.name} was successfully destroyed."
                    }
      end
      format.json { head :no_content }
    end
  end
end
