require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    let(:user) { FactoryBot.create(:user) }
    it 'ensure name is present' do
      user.name = nil
      expect(user.save).to eq(false)
    end

    it 'ensures name length is >= 3 characters' do
      expect(user.name.length).to be >= 3
    end
  end

  context 'associations' do
    it 'should have many votes' do
      t = User.reflect_on_association(:votes)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many articles' do
      t = User.reflect_on_association(:articles)
      expect(t.macro).to eq(:has_many)
    end
  end
end
