class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service

  def create
    product = Product.find_by(id: item_params[:product_id])
    if product.present?
      @item_service.add_to_cart(product)
      flash[:success] = "Item added to cart."
    else
      flash[:danger] = "Something went wrong!"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    item = Item.find_by(id: params[:id])
    if item.present?
      item.destroy
      flash[:success] = "Item removed from cart."
    else
      flash[:danger] = "Something went wrong!"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def item_params
    params.require(:item).permit(:quantity, :product_id)
  end

  def set_service
    @item_service = ItemService.new(params, current_user)
  end

end
