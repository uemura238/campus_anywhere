# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:other_user) }
  let(:relationship) do
    FactoryBot.create(:relationship, follower: user, followed: other_user)
  end

  describe 'リレーションが正しく行わているとき' do
    it 'フォローとフォロワーと名前が正しいこと' do
      expect(relationship).to be_valid
      expect(relationship.follower.name).to eq user.name
      expect(relationship.followed.name).to eq other_user.name
    end
  end

  describe 'validation' do
    let(:user) { FactoryBot.create(:user) }
    let(:other_user) { FactoryBot.create(:user) }
    let(:relationship) { user.active_relationships.build(followed_id: other_user.id) }

    it 'is valid with test data' do
      expect(relationship).to be_valid
    end

    describe 'presence' do
      it 'is invalid without follower_id' do
        relationship.follower_id = nil
        expect(relationship).to be_invalid
      end
      it 'is invalid without followed_id' do
        relationship.followed_id = nil
        expect(relationship).to be_invalid
      end
    end
  end
end
