require 'rails_helper'

describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品がうまくいくとき' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品が上手くいかないとき' do
      it '商品名が空では出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品説明が空では出品できない' do
        @item.product_introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product introduction can't be blank")
      end

      it 'カテゴリーが空では出品できない' do
        @item.product_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category can't be blank")
      end

      it 'カテゴリーにID1が選択されていた場合は出品できない' do
        @item.product_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product category must be other than 1')
      end

      it '商品の状態が空では出品できない' do
        @item.product_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end

      it '商品の状態にID1が選択されていた場合は出品できない' do
        @item.product_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product status must be other than 1')
      end

      it '配送料の負担が空では出品できない' do
        @item.delivery_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end

      it '配送料にID1が選択されていた場合は出品できない' do
        @item.delivery_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery burden must be other than 1')
      end

      it '配送元の地域が空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '配送元にID1が選択されていた場合は出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '発送までの日数が空では出品できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it '発送までの日数にID1が選択されていた場合は出品できない' do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
      end

      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が全角数字の場合は、出品できない' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格299円以下では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格10,000,000円以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
