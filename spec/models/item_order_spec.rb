require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '商品購入機能' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    context '商品が購入できる場合' do
      it 'token,zip_code,prefecture,city,block,phoneが入力されていること' do
        expect(@item_order).to be_valid
      end
    end

    context '商品出品できない場合' do
      it 'tokenがないと購入できないこと' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'zip_codeが空だと購入できないこと' do
        @item_order.zip_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Zip code can't be blank")
      end

      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @item_order.zip_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Zip code is invalid. Half-width number, Include hyphen(-)')
      end

      it 'zip_codeが全角数字だと購入できないこと' do
        @item_order.zip_code = '１２３１２３４'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Zip code is invalid. Half-width number, Include hyphen(-)')
      end

      it 'prefectureが未選択だと購入できないこと' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityが空だと購入できないこと' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空だと購入できないこと' do
        @item_order.block = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Block can't be blank")
      end

      it 'phoneが空だと購入できないこと' do
        @item_order.phone = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneに半角数字以外の値が入っていると購入できないこと' do
        @item_order.phone = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone is invalid. Half-width number, without hyphen(-)')
      end

      it 'phoneの番号は11桁超過だと登録できないこと' do
        @item_order.phone = '111111111111'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number is too long(maximum 11)')
      end
    end
  end
end
