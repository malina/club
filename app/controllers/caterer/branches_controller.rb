class Caterer::BranchesController < ApplicationController
  before_filter :find_caterer

  def find_caterer
    @caterer = Caterer.find params[:caterer_id]
  end

  def create
    @caterer.branches = params[:items]
    render text: 'ok'
  end
end
