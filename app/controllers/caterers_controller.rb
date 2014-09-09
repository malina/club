class CaterersController < ApplicationController
  before_filter :find_city, only: %w(index)
  before_filter :find_caterer, only: %w(show edit update)
  before_filter :new_caterer, only: %w(new create)
  before_filter :find_caterers, only: %w(index)



  ## Filters
  def find_caterer
    @caterer = Caterer.find params[:id]
  end

  def find_city
    @city = params[:city_id] ? City.find(params[:city_id]) : City.first
  end

  def new_caterer
    @caterer = Caterer.new caterer_params
  end
  
  def find_caterers
    @caterers = Caterer.all
    unless requested_cuisines.empty?
      @caterers = @caterers.where(cuisine_ids: {"$elemMatch" => {"$in" => requested_cuisines}})
    end
  end
  
  

  ## Url parameters
  def requested_cuisines
    params[:cuisines].to_s.split(',')
  end
  
  def requested_district
    params[:district]
  end
  
  def requested_options
    params[:options]
  end
  
  def requested_sort
    params[:sort]
  end

  def requested_set
    params[:set]
  end



  ## Strong parameters config
  def caterer_params
    params.require(:caterer).permit(
      :name, :response_time, :city_id, :about, :avatar, :avatar_cache
    ).tap do |whitelisted|
      whitelisted[:cuisine_ids] = params[:caterer][:cuisine_ids]
    end unless params[:caterer].blank?
  end
  
  

  ## Actions
  def index
    respond_to do |format|
      format.html
      format.json { render json: @caterers }
    end
  end  

  def create
    if @caterer.save
      redirect_to new_caterer_path
    else
      render :new
    end
  end

  def update
    if @caterer.update_attributes caterer_params
      redirect_to edit_caterer_path(@caterer), notice: "Success"
    else
      render :edit
    end
  end
end
