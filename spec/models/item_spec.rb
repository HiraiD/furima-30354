require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'item  #商品情報' do
  
    it "current_user.idが存在すれば登録できること" do
      expect(@item).to be_valid
    end
    
    it "商品のmane(名)が記載されていないと登録できないこと" do
      @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
    end
  
    it "商品のinformaion(商品情報)が記載されていないと登録できないこと" do
      @item.informaion = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Informaion can't be blank")
    end
  
    it "商品の対象は誰なのか記載されていないと登録できないこと" do
      @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
    end
  
    it "誰が送料の負担をするのか記載されていないと登録できないこと" do
      @item.burden_of_shipping_charges_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden of shipping charges can't be blank")
    end

    it "どこに配送するのか記載されていないと登録できないこと" do
      @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
  
    it "発送日までの日数が記載されていないと登録できないこと" do
      @item.estimated_shipping_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping can't be blank")
    end

    it "商品の状態が記載されていないと登録できないこと" do
      @item.product_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
    end
  
    it "出品価格が299円以下では登録できないことないと登録できないこと" do
      @item.product_condition_id = "299円"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition is not a number")
    end
  
    it "出品価格が10,000,000円以上では登録できないことないと登録できないこと" do
      @item.product_condition_id = "10,000,000円"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition is not a number")
    end

    it "全角文字では登録できないこと" do
      @item.product_condition_id = "あああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition is not a number")
    end
    
    it "全半角英数混合では登録できないこと" do
      @item.product_condition_id = "aaAAああ１１11"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition is not a number")
    end

    it "半角英語だけでは登録できないこと" do
      @item.product_condition_id = "aaabbcc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition is not a number")
    end

    it "空では登録できないこと" do
      @item.product_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition is not a number")
    end


  end
end
