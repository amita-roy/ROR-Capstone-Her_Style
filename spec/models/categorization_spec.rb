require 'rails_helper'

RSpec.describe Categorization, type: :model do
  context 'associations' do
    it 'should belongs to an article' do
      t = Categorization.reflect_on_association(:article)
      expect(t.macro).to eq(:belongs_to)
    end
    it 'should belongs to a category' do
      t = Categorization.reflect_on_association(:category)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
