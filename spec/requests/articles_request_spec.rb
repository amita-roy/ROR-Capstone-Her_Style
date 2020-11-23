require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  it 'creates a article and redirects to signin path' do
    get '/articles/new'
    expect(response).to redirect_to('/signin')
  end

  it 'does not render a different template' do
    get '/articles/new'
    expect(response).to_not render_template(:show)
  end
end
