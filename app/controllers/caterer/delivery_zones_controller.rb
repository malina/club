class Caterer::DeliveryZonesController < ApplicationController
  before_filter :find_caterer

  def find_caterer
    @caterer = Caterer.find params[:caterer_id]
  end

  def create
    @caterer.delivery_zones = (params[:items] || []).map{|zone| zone.except!(:showExtras) }
    render text: 'ok'
  end
end
