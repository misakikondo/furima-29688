require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品管理機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品できる場合' do
      it '画像１枚と全ての入力フォームが記入されていること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it 'imageがないと出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'items_nameが空だと登録できないこと' do
        @item.items_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end

      it 'explainsが空だと登録できないこと' do
        @item.explains = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explains can't be blank")
      end

      it 'Priceが空だと出品できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price Half-width number')
      end

      it 'Priceが300未満だと出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'Priceが9999999超過だと出品できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'Priceが半角数字でないと出品できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'Categoryが未選択だと出品できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'Conditionが未選択だと出品できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it 'Shipping methodが未選択だと出品できないこと' do
        @item.shipping_method_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping method Select')
      end

      it 'Item locationが未選択だと出品できないこと' do
        @item.item_location_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Item location Select')
      end

      it 'Days to shipが空だと出品できないこと' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship Select')
      end
    end
  end
end
