require 'rails_helper'

RSpec.describe Micropost, type: :model do
  before do
    @micropost = FactoryBot.build(:micropost)
  end

  describe 'レビュー投稿' do
    context '投稿がうまくいくとき' do
      it 'すべての項目が存在すれば投稿できる' do
        expect(@micropost).to be_valid
      end

      it 'univが50文字以下だと投稿できる' do
        @micropost = FactoryBot.build(:micropost, univ: 'a' * 50)
        expect(@micropost).to be_valid
      end

      it 'contentが255文字以下だと投稿できる' do
        @micropost = FactoryBot.build(:micropost, content: 'a' * 255)
        expect(@micropost).to be_valid
      end
    end

    context '新規投稿がうまく行かないとき' do
      it 'univが空だと投稿できない' do
        @micropost.univ = nil
        @micropost.valid?
        expect(@micropost.errors.full_messages).to include("Univ can't be blank")
      end

      it 'contentが空だと投稿できない' do
        @micropost.content = nil
        @micropost.valid?
        expect(@micropost.errors.full_messages).to include("Content can't be blank")
      end

      it 'univが51文字以上だと投稿できない' do
        @micropost = FactoryBot.build(:micropost, univ: 'a' * 51)
        expect(@micropost).to be_invalid
      end

      it 'contentが256文字以上だと投稿できない' do
        @micropost = FactoryBot.build(:micropost, content: 'a' * 256)
        expect(@micropost).to be_invalid
      end
    end
  end
end
