require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:other_user) }
  let(:micropost) { FactoryBot.create(:micropost, user: other_user) }
  let(:favorite) do
    FactoryBot.create(:favorite, user: user, micropost: micropost)
  end

  context 'リレーションが正しく行わているとき' do
    it 'ユーザーの名前と記事のタイトルが正しいこと' do
      expect(favorite).to be_valid
      expect(favorite.user.name).to eq user.name
      expect(favorite.micropost.univ).to eq micropost.univ
    end
  end
end
