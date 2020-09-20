require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できる場合' do
      it 'nickname、email、passwordとpassword_confirmation、family_name、first_name、family_name_kana、first_name_kana、birthが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'misakidayo0718'
        @user.password_confirmation = 'misakidayo0718'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だと登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@が含まれないと登録できないこと' do
        @user.email = 'aaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'emailが登録済みだと登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空だと登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが5文字以下だと登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは半角英数字混合でないと登録できないこと' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'family_nameが空だと登録できないこと' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameが空だと登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_name_kanaが空だと登録できないこと' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_nameとfirst_nameは全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.first_name = 'misaki'
        @user.family_name = 'kondo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid', 'First name is invalid')
      end

      it 'family_name_kanaとfirst_name_kanaのフリガナは全角（カタカナ）でないと登録できないこと' do
        @user.family_name_kana = '近藤'
        @user.first_name_kana = 'みさき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid', 'First name kana is invalid')
      end

      it 'birthが空だと登録できないこと' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
