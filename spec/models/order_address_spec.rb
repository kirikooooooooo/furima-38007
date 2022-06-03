require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '商品購入の保存ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
      it 'building_nameは空でも保存できること' do
      end
    end

    context '商品購入の保存ができない場合' do
      it 'postal_codeが空だと保存できない' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'prefectureを選択していないと保存できないこと' do
      end
      it 'cityが空だと保存できないこと' do
      end
      it 'addressが空だと保存できないこと' do
      end
      it 'phone_numberが空だと保存できないこと' do
      end
      it 'phone_numberが全角数字だと保存できないこと' do
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end
      it 'itemが紐付いていないと保存できないこと' do
      end
    end
  end
end
