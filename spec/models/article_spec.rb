require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'associations' do
    it 'should belongs to a user' do
      t = Article.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should have many votes' do
      t = Article.reflect_on_association(:votes)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many categories' do
      t = Article.reflect_on_association(:categories)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many categorizations' do
      t = Article.reflect_on_association(:categorizations)
      expect(t.macro).to eq(:has_many)
    end
  end
end
