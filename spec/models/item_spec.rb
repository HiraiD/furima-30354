require 'rails_helper'

RSpec.describe Item, type: :model do
  
     before do
       @item = FactoryBot.build(:item)
      end

  describe 'item  #商品情報' do
  
    context '内容に問題ない' do   
    
      it "current_user.idが存在すれば登録できること" do
        expect(@item).to be_valid
      end
    end

  context '内容に問題がある場合' do  
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
  
      it "出品価格が299以下では登録できないことないと登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ¥300円から¥9,999,999の範囲でお願いいたします。")
      end
  
      it "出品価格が10000000以上では登録できないことないと登録できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price ¥300円から¥9,999,999の範囲でお願いいたします。")
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


    it "product_conditionの選択しの中で1以外でないと登録できないこと"do
      @item.product_condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition must be other than 1")
    end
  
    it "estimated_shippingの選択しの中で1以外でないと登録できないこと"do
        @item.estimated_shipping_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping must be other than 1")
      end
  
      it "shipping_areaの選択しの中で1以外でないと登録できないこと"do
        @item.shipping_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
        end
  
    it "burden_of_shipping_chargesの選択しの中で1以外でないと登録できないこと"do
      @item.burden_of_shipping_charges_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden of shipping charges must be other than 1")
     end

     it "categoryの選択しの中で1以外でないと登録できないこと"do
     @item.category_id = "1"
     @item.valid?
     expect(@item.errors.full_messages).to include("Category must be other than 1")
    end


  end
  end
end
