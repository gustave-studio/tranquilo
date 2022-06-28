require 'rspec'
require 'rails_helper'

describe 'UsersController', type: :controller do
  it { expect(get: '/signup').to route_to('users#new') }

  let(:user) { User.create(name: "Example User",
                        email: "user@example.com",
                        password: "foobar",
                        password_confirmation: "foobar") }

  describe do
    it { expect(user.valid?).to be(true) }
  end

  describe 'nameが空の場合' do
    before { user.name = '' }
    it { expect(user.valid?).to be(false) }
  end

  describe 'nameの長さが51文字の場合' do
    before { user.name = 'a' * 51 }
    it { expect(user.valid?).to be(false) }
  end

  describe 'emailが空の場合' do
    before { user.email = '' }
    it { expect(user.valid?).to be(false) }
  end

  describe 'emailの長さが244文字の場合' do
    before { user.name = "a" * 244 + "@example.com" }
    it { expect(user.valid?).to be(false) }
  end

  describe 'emailのフォーマット' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      before { user.email = invalid_address }
      it { expect(user.valid?).to be(false) }
    end
  end

  describe 'emailアドレスの一意性' do
    let(:duplicate_user) { user.dup }
    it { expect(duplicate_user.valid?).to be(false) }
  end

  describe 'emailアドレスの大文字を区別しない一意性' do
    let(:duplicate_user) { user.dup }
    before { duplicate_user.email = duplicate_user.email.upcase }
    it { expect(duplicate_user.valid?).to be(false) }
  end

  describe 'パスワードが空白' do
    before { user.password = ' ' * 6 }
    it { expect(user.valid?).to be(false) }
  end

  describe 'パスワードの最小文字数' do
    before { user.password = 'a' * 5 }
    it { expect(user.valid?).to be(false) }
  end
end
