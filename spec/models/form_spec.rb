require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
  @form = FactoryBot.build(:form)
  end

  describe 'form  #商品買う時' do
    context '内容に問題ない' do
    it 'current_user.idが存在すれば登録できること' do
    expect(@form).to be_valid
    end
     
    it 'item_idが存在すれば購入できること' do
     @from.item_id = '1'
      @purchase.valid?
    expect(@from).to be_valid
     end
    end
  end

  context '内容に問題がある場合' do

    it '郵便番号が記載されていないと登録できないこと' do
    @from.post = ''
    @from.valid?
    expect(@from.errors.full_messages).to include("Name can't be blank")
    end

    it '都道府県の選択されないと登録できないこと' do
      @from.shipping_area_id = ''
      @from.valid?
      expect(@from.errors.full_messages).to include("Name can't be blank")
      end

      it '市町村の記載がないと登録できないこと' do
       @from.municipality = ''
      @from.valid?
      expect(@from.errors.full_messages).to include("Name can't be blank")
      end
        it '番地の記載がないと登録できないこと' do
        @from.address = ''
        @from.valid?
        expect(@from.errors.full_messages).to include("Name can't be blank")
        end

      it '電話番号の記載がないと登録できないこと' do
       @from. phone_number = ''
        @from.valid?
        expect(@from.errors.full_messages).to include("Name can't be blank")
      end

      it '料金の記載がないと登録できないこと' do
        @from.price = ''
        @from.valid?
        expect(@from.errors.full_messages).to include("Name can't be blank")
      end

        it 'tokenの記載がないと登録できないこと' do
        @from.token= ''
        @from.valid?
        expect(@from.errors.full_messages).to include("Name can't be blank")
        end
  end
end
