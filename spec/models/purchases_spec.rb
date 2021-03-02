require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase, user_id: @user.id, item_id: @item.id)
  end

  describe 'buy  #購入機能' do
    context '内容に問題ない' do
      it 'current_user.idであれば購入できる' do
        expect(@item).to be_valid
      end
      it '郵便番号の記載にはハイフン(-)があれば購入できる' do
        @purchase.post = '123-4567'
        @purchase.valid?
        expect(@purchase).to be_valid
      end

      it '携帯番号と電話番号は11桁以内であれば購入できる' do
        @purchase.phone_number = '09012345678'
        @purchase.valid?
        expect(@purchase).to be_valid
      end

      it '建物名が空であっても購入できる' do
        @purchase.building_name = ''
        @purchase.valid?
        expect(@purchase).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が記載がないと購入できない' do
        @purchase.post = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post 郵便番号の記載をお願いいたします.')
      end

      it 'どこに配送するのか記載がないと購入できない' do
        @purchase.shipping_area_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '配送の選択肢が１だと購入できない' do
        @purchase.shipping_area_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Shipping area must be other than 1')
      end

      it '市町村の記載がないと購入できない' do
        @purchase.municipality = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地の記載がないと購入できない' do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end

      it '携帯番号の記載がないと購入できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is not a number")
      end

      it '携帯番号と電話番号は11桁以内でハイフン（ー)があると購入できない' do
        @purchase.phone_number = '090-1234-5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is not a number')
      end

      it '郵便番号の記載にはハイフン(-)の記載がないと購入できない' do
        @purchase.post = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post 郵便番号の記載をお願いいたします.')
      end

      it 'tokenの記載がないと購入できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it '電話番号が英数字混合では購入できない' do
        @purchase.phone_number = '090a1234b5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is not a number')
      end

      it '電話番号が12桁以上では購入できない' do
        @purchase.phone_number = '090123456789'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number Too long')
      end

      it 'item_idが空では購入できない' do
        @purchase.item_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空では購入できない' do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
