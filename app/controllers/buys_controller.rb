class BuysController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @user_purchase = Purchase.new
  end


  def create
    @item = Item.find(params[:item_id])   
    @user_purchase = Purchase.new(purchase_params)
       #binding.pry
    if@user_purchase.valid?
      @user_purchase.save
    #Buy.create(buy_params(user))
    #StreetAddre.create(street_addre_params(user))
    redirect_to root_path
    else
    render action: :index
    end
  end

  private 
  # 全てのストロングパラメーターを1つに統合
  def purchase_params
    params.require(:purchase).permit(:post,:shipping_area_id,:municipality,:address,:building_name,:phone_number ).merge(user_id: current_user.id ,item_id:params[:item_id],token: params[:token])
  end
end

#def set_item
 # @item = Item.find(params[:item_id])
#end


# ①ストロングパラメータでフォームからの情報を受け取る。
# ②ストロングパラメータで受け取った情報を元に、form_objectのインスタンスを作る。
# ③作ったインスタンスがバリデーションを通過できるか検証をする。
# ④作ったインスタンスをsaveする。（フォームオブジェクト内に定義したsaveメソッドを使用）

















