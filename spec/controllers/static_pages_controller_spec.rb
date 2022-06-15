require 'rspec'
require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  describe 'StaticPagesController' do
    it 'homeが表示される' do
      get :home
      expect(response).to have_http_status(200)
      expect(response.body).to include('Ruby on Rails Tutorial Sample App')
    end

    it 'homeが表示される' do
      get :help
      expect(response).to have_http_status(200)
      expect(response.body).to include("Help | Ruby on Rails Tutorial Sample App")
    end

    it 'homeが表示される' do
      get :about
      expect(response).to have_http_status(200)
      expect(response.body).to include("About | Ruby on Rails Tutorial Sample App")
    end
  end
end
