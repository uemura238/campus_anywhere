require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上だと登録できる' do
        @user = FactoryBot.build(:user, password: 'a' * 6, password_confirmation: 'a' * 6)
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまく行かないとき' do
      it 'nameが空だと登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下だと登録できない' do
        @user = FactoryBot.build(:user, password: 'a' * 5, password_confirmation: 'a' * 5)
        expect(@user).to be_invalid
      end
    end
  end

  describe 'follow and unfollow' do
    let(:user) { FactoryBot.create(:user) }
    let(:other_user) { FactoryBot.create(:user) }

    before { user.follow(other_user) }

    describe 'follow' do
      it 'succeeds' do
        expect(user.following?(other_user)).to be_truthy
      end
    end

    describe 'followers' do
      it 'succeeds' do
        expect(other_user.followers.include?(user)).to be_truthy
      end
    end

    describe 'unfollow' do
      it 'succeeds' do
        user.unfollow(other_user)
        expect(user.following?(other_user)).to be_falsy
      end
    end
  end

  describe 'def feed' do
    let(:user) { FactoryBot.create(:user, :with_microposts) }
    let(:other_user) { FactoryBot.create(:user, :with_microposts) }

    context 'when user is following other_user' do
      before { user.active_relationships.create!(followed_id: other_user.id) }

      # it "contains other user's microposts within the user's Micropost" do
      #   other_user.microposts.each do |post_following|
      #     expect(user.feed.include?(post_following)).to be_truthy
      #   end
      # end

      it "contains the user's own microposts in the user's Micropost" do
        user.microposts.each do |post_self|
          expect(user.feed.include?(post_self)).to be_truthy
        end
      end
    end

    context 'when user is not following other_user' do
      it "doesn't contain other user's microposts within the user's Micropost" do
        other_user.microposts.each do |post_unfollowed|
          expect(user.feed.include?(post_unfollowed)).to be_falsy
        end
      end
    end
  end

  describe 'dependent: :destroy' do
    before do
      @user.save
      @user.microposts.create!(univ: 'Lorem ipsum', content: 'Lorem ipsum')
    end

    it 'succeeds' do
      expect do
        @user.destroy
      end.to change(Micropost, :count).by(-1)
    end
  end
end
