class Caterer::DefaultDeliveryZoneController < ApplicationController
  before_filter :find_caterer
  helper_method :delivery_zone

  def find_caterer
    @caterer = Caterer.find params[:caterer_id]
  end

  # def edit
  #   debugger
  # end

  def delivery_zone
    @caterer.default_delivery_zone
  end

  def update
    delivery_zone.update_attributes delivery_zone_params
    redirect_to edit_caterer_default_delivery_zone_path(@caterer), notice: 'Success'
  end

  def delivery_zone_params
    params.require(:delivery_zone).permit(
      :delivery_time, :minimum_order_value, :delivery_charge, :teaser
    ).tap do |whitelisted|
      whitelisted[:schedule] = params[:delivery_zone][:schedule]
      whitelisted[:payment_options] = params[:delivery_zone][:payment_options]
    end
  end
end
