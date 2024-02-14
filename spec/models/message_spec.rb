require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'レビュー投稿' do
    context '送信がうまくいくとき' do
      it 'すべての項目が存在すれば投稿できる' do
        expect(@message).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'contentが空だと登録できない' do
        @message.content = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Contentを入力してください')
      end
    end
  end
end
