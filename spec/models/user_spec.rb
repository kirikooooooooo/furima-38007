require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できる場合' do
      it 'すべてのカラムが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test123'
        @user.password_confirmation = 'test12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'name_lastnameが空では登録できない' do
        @user.name_lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name lastname can't be blank")
      end
      it 'name_firstnameが空では登録できない' do
        @user.name_firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name firstname can't be blank")
      end
      it 'name_kana_lastnameが空では登録できない' do
        @user.name_kana_lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana lastname can't be blank")
      end
      it 'name_kana_firstnameが空では登録できない' do
        @user.name_kana_firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana firstname can't be blank")
      end
      it 'birthdateが空では登録できない' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
      it 'name_lastnameが半角では登録できない' do
        @user.name_lastname = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name lastname 全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it 'name_firstnameが半角では登録できない' do
        @user.name_firstname = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name firstname 全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it 'name_kana_lastnameが半角では登録できない' do
        @user.name_kana_lastname = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana lastname 全角カタカナで入力してください")
      end
      it 'name_kana_firstnameが半角では登録できない' do
        @user.name_kana_firstname = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana firstname 全角カタカナで入力してください")
      end
    end
  end
end