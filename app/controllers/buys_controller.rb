class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :con_item, only: [:index, :create]
  before_action :app_item, only: [:index, :create]

  def index
    @user_purchase = Purchase.new
    if current_user.id == @item.user_id
      # ログインしているユーザー　＝＝　商品を出品した人(何を記述しているのか記載)
      redirect_to root_path
    else
      render action: :index
    end
  end

  def create
    pay_item
    @user_purchase = Purchase.new(purchase_params)
    if @item_purchase.valid?
      if current_user.id == @item.user_id
        redirect_to root_path
      else
        render action: :index
      end
    end
  end

  private

  # 全てのストロングパラメーターを1つに統合 何がどようになっているのか記載を残したいです。
  def purchase_params
    params.require(:purchase).permit(:post, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = 'sk_test_0a13d9a08559b03b92a6abc7' # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def app_item
    redirect_to root_path unless @item.buy.nil?
    # しょうひんが売れていたらという条件式を書く。show.html.erbのSoldOutで使われているぶぶんを参考にする。
  end

  # ＠itemを定義するメソッドを作成
  def con_item
    @item = Item.find(params[:item_id])
  end
end
