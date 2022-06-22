require 'rspec'
require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  describe 'StaticPagesController' do
    it 'homeが表示される' do
      get :home
      expect(response).to have_http_status(200)
      expect(response.body).to include('Ruby on Rails Tutorial Sample App')
      expect(response.body).to have_title('Ruby on Rails Tutorial Sample App')
    end

    it 'helpが表示される' do
      get :help
      expect(response).to have_http_status(200)
      expect(response.body).to include("Help | Ruby on Rails Tutorial Sample App")
      expect(response.body).to have_title('Help | Ruby on Rails Tutorial Sample App')
    end

    it 'aboutが表示される' do
      get :about
      expect(response).to have_http_status(200)
      expect(response.body).to include("About | Ruby on Rails Tutorial Sample App")
      expect(response.body).to have_title('About | Ruby on Rails Tutorial Sample App')
    end

    it 'contactが表示される' do
      get :contact
      expect(response).to have_http_status(200)
      expect(response.body).to include("Contact | Ruby on Rails Tutorial Sample App")
      expect(response.body).to have_title('Contact | Ruby on Rails Tutorial Sample App')
    end
  end
end
