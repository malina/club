class Caterer::GenController < ApplicationController
  before_filter :find_caterer
  helper_method :gen
  
  def find_caterer
    @caterer = Caterer.find params[:caterer_id]
  end
  
  def gen
    @caterer.gen || @caterer.create_gen
  end
  
  def update
    gen.update_attributes gen_params
    redirect_to edit_caterer_gen_path(@caterer), notice: "Success"
  end
  
  def gen_params
    params.require(:caterer_gen).permit(
      :title, :description, :keywords, :footer_title, :footer_text
    )
  end
end
