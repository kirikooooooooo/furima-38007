require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it 'すべてのカラムが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'テキストのみで投稿できる' do
      end
    end
    context '商品が出品できない場合' do
      it '商品画像が空では投稿できない' do
      end
      it '商品名が空では投稿できない' do
      end
      it '商品名が41文字以上では投稿できない' do
      end
      it '商品の説明が空では投稿できない' do
      end
      it '商品の説明が1001文字以上では投稿できない' do
      end
      it 'カテゴリーが空では投稿できない' do
      end
      it '商品の状態が空では投稿できない' do
      end
      it '配送料の負担が空では投稿できない' do
      end
      it '配送元の地域が空では投稿できない' do
      end
      it '発送までの日数が空では投稿できない' do
      end
      it '価格が空では投稿できない' do
      end
      it '価格が299以下では投稿できない' do
      end
      it '価格が10000000以上では投稿できない' do
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
      end
    end
  end
end
