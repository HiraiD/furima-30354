class ItemsController < ApplicationController
  before_action :authenticate_user! , except: new
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

 
  def create
     @item = Item.new(item_params)
    if @item.save
        redirect_to root_path
    else
      render :new
    end
  end

def item_params
   params.require(:item).permit(:name,:informaion,:category_id,:burden_of_shipping_charges_id,:shipping_area_id,:estimated_shipping_id,:image,:product_condition_id,:price).merge(user_id: current_user.id)
end

end
