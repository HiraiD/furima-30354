class BuysController < ApplicationController
  before_action :authenticate_user!, except: [:create]
    def index
      @item = Item.find(params[:item_id])
      if current_user.id == @item.user_id
       #ログインしているユーザー　＝＝　商品を出品した人(何を記述しているのか記載)

    @user_purchase = Purchase.new
    redirect_to root_path
  else
    render action: :index
    end
  end

  
def creates
    @item = Item.find(params[:item_id])
    pay_item
    @user_purchase = Purchase.new(purchase_params)
      # binding.pry
      if@item_purchase.save
      # Buy.create(buy_params(user))
      # StreetAddre.create(street_addre_params(user))
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  # 全てのストロングパラメーターを1つに統合 何がどようになっているのか記載を残したいです。
  def purchase_params
    params.require(:purchase).permit(:post, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :pirce).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end

def pay_item
  Payjp.api_key = 'sk_test_0a13d9a08559b03b92a6abc7' # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item.price, # 商品の値段
    card: purchase_params[:token], # カードトークン
    currency: 'jpy' # 通貨の種類（日本円）
  )
end

# def set_item
# @item = Item.find(params[:item_id])
# end

# ①ストロングパラメータでフォームからの情報を受け取る。
# ②ストロングパラメータで受け取った情報を元に、form_objectのインスタンスを作る。
# ③作ったインスタンスがバリデーションを通過できるか検証をする。
# ④作ったインスタンスをsaveする。（フォームオブジェクト内に定義したsaveメソッドを使用）
