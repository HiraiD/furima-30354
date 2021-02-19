class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index,:show]
  before_action :set_item, only: [:update,:show,:edit]
  before_action :move_to_index, only: [:edit,:update]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def edit
  end
   #残す目的  
   #上記のeditの記述でもいいとおもいますが、if文の記述だとコードが 長くなっていること
   # 何らかの理由ですり抜けて通ってしまうことがあり下記の記述することで今の記述よりも強い記述とメンターさんが
   # 言ってことや教えてもらったので残しておきたいです。
  #return redirect_to root_path if current_user.id != @item.user.id  
 

  def show
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
  unless current_user.id == @item.user_id
    redirect_to action: :index
  end
end

def set_item
  @item = Item.find(params[:id])
end


end