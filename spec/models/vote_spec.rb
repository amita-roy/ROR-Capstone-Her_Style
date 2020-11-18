require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'associations' do
    it 'should belongs to a user' do
      t = Vote.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
    it 'should belongs to an article' do
      t = Vote.reflect_on_association(:article)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
