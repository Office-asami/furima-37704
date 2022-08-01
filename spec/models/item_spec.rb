require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it '商品名、商品説明、カテゴリ、商品の状態、配送料負担情報、発送元地域情報、発送までの日数情報、300円以上一千万円未満の価格情報があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '商品画像を1つもつけられていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名がないと登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it '商品の説明がないと登録できない' do
        @item.overview = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Overview can't be blank"
      end
      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態の情報がないと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料の負担の情報がないと登録できない' do
        @item.fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee burden can't be blank"
      end
      it '発送元の地域の情報ないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数の情報がないと登録できない' do
        @item.handling_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Handling time can't be blank"
      end
      it '価格の情報がないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '価格が300円未満であると登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than 299'
      end
      it '価格が10,000,000円以上であると登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end
      it '価格が半角英数以外であると登録できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end
