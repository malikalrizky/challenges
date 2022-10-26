ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  private

  def t(*args)
    I18n.t(*args)
  end

  def sign_in_user(email, password)
    get new_user_session_path
    post(user_session_path, params: {
           user: {
             email: email,
             password: password
           }
         })
    follow_redirect!
  end

  def assert_follow_link(path)
    assert_select "a[href='#{path}']"
    get path
  end

  def tokn_X
    text_card = {
      name: 'Test',
      number: '4111 1111 1114 0011',
      expiration_month: '12',
      expiration_year: Time.current.year + 1,
      security_code: '454'
    }

    @omise_token ||= Omise::Token.create(card: text_card).id
  end
end
