require 'rails_helper'

RSpec.describe Purchase, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase= FactoryBot.build(:purchase, user_id: @user.id, item_id: @item.id)
      # sleep(5)
    end


  describe 'buy  #購入機能' do
    context '内容に問題ない' do
      it 'current_user.idが存在すれば購入できること' do
        expect(@item).to be_valid
      end
      it '郵便番号の記載にはハイフン(-)が購入できること' do
        @purchase.post = '123-4567'
        @purchase.valid?
        expect(@purchase).to be_valid
      end
     
      it '携帯番号と電話番号は11桁以内で記載されていないと登録できこと' do
        @purchase.phone_number = '09012345678'
        @purchase.valid?
        expect(@purchase).to be_valid
      end
      it '建物名が空でも登録できこと' do
        @purchase.building_name  = ''
        @purchase.valid?
        expect(@purchase).to be_valid
      end
    end
  
  
    context '内容に問題がある場合' do
      it '郵便番号が記載されていないと登録できないこと' do
        @purchase.post = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post 郵便番号の記載をお願いいたします.")
      end
      
      it 'どこに配送するのか記載されていないと登録できないこと' do
        @purchase.shipping_area_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping area can't be blank")
      end
  
      it '配送の選択肢が１だと登録できないこと' do
        @purchase.shipping_area_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping area can't be blank")
      end
     
      it '市町村の記載されていないと登録できないこと' do
        @purchase.municipality = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
      end
  
      it '番地の記載されていないと登録できないこと' do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
  
      it '携帯番号の記載されていないと登録できないこと' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
  
      it '携帯番号と電話番号は11桁以内でハイフン（ー)が記載されていいると登録できないこと' do
        @purchase.phone_number = '090-1234-5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is not a number")
      end
      
      it '郵便番号の記載にはハイフン(-)が存在しないとば購入できること' do
        @purchase.post  = '1234567'
        #binding.pry
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post 郵便番号の記載をお願いいたします.")
      end
      
        it 'tokenの記載がないと登録できないこと' do
        @purchase.token= ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
        end
    end
  end
end

 
 


# #bundle exec rspec spec/models/purchases_spec.rb
# #bundle exec rspec spec/models/tweet_spec.rb 
# % bundle exec rspec spec/models/_spec.rb 