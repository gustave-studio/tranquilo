require 'rspec'
require 'rails_helper'

describe 'SessionsController', type: :controller do
  render_views

  describe 'StaticPagesController' do
    it 'homeが表示される' do
      get :home
      expect(response).to have_http_status(200)
      expect(response.body).to include('Ruby on Rails Tutorial Sample App')
      expect(response.body).to have_title('Ruby on Rails Tutorial Sample App')
    end
  end
end
