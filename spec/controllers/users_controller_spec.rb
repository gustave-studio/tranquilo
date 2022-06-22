require 'rspec'
require 'rails_helper'

describe 'UsersController', type: :controller do
  it { expect(get: '/signup').to route_to('users#new') }
end
