require 'rails_helper'

RSpec.describe User, type: :model do
  #describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
      end

      it "数字のみ(6文字以上)では登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

        it "英語のみ(6文字以上)では登録できないこと" do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end
  
        it "全角では登録できないこと" do
        @user.password = "１２３４５あ"
        @user.password_confirmation = "１２３４５あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

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
      
      
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    
      it"emailに＠がないものは登録できない" do
        @user.email = "aaa.ne.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      
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

      it "last_name_kanaが半角英数の場合は登録できないこと" do
        @user.last_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaがカタカナ以外の全角の場合は登録できないこと" do
        @user.last_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "first_nameがない場合は登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_name_kanaが半角英数の場合は登録できないこと" do
        @user.first_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaがカタカナ以外の全角の場合は登録できないこと" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      
      
      it "first_nameが半角英数字だったときに保存ができない" do
        @user.first_name = "aa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
   
      it "last_nameが半角英数字だったときに保存ができない" do
        @user.last_name = "a11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      
      
      #last_nameが半角英数字だったときに保存ができないテストをしましょう！
      #@user.last_nameに半角英数字の値を代入しましょう！
      #バリデーションをチェックしましょう！
      #期待されるメッセージを書きましょう！
      
      it "birth_dateがない場合は登録できないこと" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      
    end
  
end
