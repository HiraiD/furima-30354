require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
  before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do

      it "nicknameが空だと登録できない" do
        @user.nickname = ""  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      #it'メールアドレスが一意性であること' do
      #end
      #binding.pry
      it "passwordがない場合は登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

  
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
   
      it "passwordとpassword_confirmationが不一致では登録できないこと" do   
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "password_confirmationがない場合は登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "last_nameがない場合は登録できないこと" do
        @user.last_name ="" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_name_kanaがない場合は登録できないこと" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "birth_dateがない場合は登録できないこと" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
