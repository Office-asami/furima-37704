require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'qwert1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'qwerty'
        @user.password_confirmation = 'qwerty'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ｑｗｅｒｔｙ'
        @user.password_confirmation = 'ｑｗｅｒｔｙ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '姓（全角）が空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.family_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it '名（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it '姓（カナ）が空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it '姓（カナ）にカタカナ以外の文字（平仮名）が含まれていると登録できない' do
        @user.family_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it '姓（カナ）にカタカナ以外の文字（漢字）が含まれていると登録できない' do
        @user.family_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it '姓（カナ）にカタカナ以外の文字（英数字）が含まれていると登録できない' do
        @user.family_name_kana = '123a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it '姓（カナ）にカタカナ以外の文字（記号）が含まれていると登録できない' do
        @user.family_name_kana = '!!!!'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it '名（カナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '名（カナ）にカタカナ以外の文字（平仮名）が含まれていると登録できない' do
        @user.first_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '名（カナ）にカタカナ以外の文字（漢字）が含まれていると登録できない' do
        @user.first_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '名（カナ）にカタカナ以外の文字（英数字）が含まれていると登録できない' do
        @user.first_name_kana = '123a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '名（カナ）にカタカナ以外の文字（記号）が含まれていると登録できない' do
        @user.first_name_kana = '!!!'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '生年月日が空だと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
