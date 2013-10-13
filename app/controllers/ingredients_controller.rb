class IngredientsController < ApplicationController
	before_action :set_menu_item, only: [:create]
  before_action :capture_new_ingredient, only: [:create]

  def create
		@menu_item.ingredients.new(@new_ingredient)
		respond_to do |format|
      if @menu_item.save
        format.html { redirect_to @menu_item, notice: 'Menu item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @menu_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
	end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_menu_item
    @menu_item = MenuItem.find(params[:menu_item_id])
  end

  def capture_new_ingredient
    # params.require(:ingredient).permit(:name)
    @new_ingredient = params.require(:ingredient).permit(:name)
  end

  # # Never trust parameters from the scary internet, only allow the white list through.
  # def menu_item_params
  #   params.require(:menu_item).permit(:name)
  # end

end
