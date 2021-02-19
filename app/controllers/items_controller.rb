class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index,:show]
  before_action :set_item, only: [:update,:show,:edit]
  # before_action :authenticate_user!
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

   def edit
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
      redirect_to root_path
    end
    #return redirect_to root_path if current_user.id != @item.user.id  
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
            redirect_to item_path
      else
        render :edit
    end
  end

  # def destroy
  #   @item = Item.destroy
  # end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:informaion,:category_id,:burden_of_shipping_charges_id,:shipping_area_id,:estimated_shipping_id,:image,:product_condition_id,:price).merge(user_id: current_user.id)
  end


def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end

def set_item
  @item = Item.find(params[:id])
end


end