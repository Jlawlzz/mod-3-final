require_relative '../test_helper'

class LookupProductsTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_searches_for_product
    visit '/'
    fill_in 'Search', with: 'sennheiser'
    click_button "Search"

    assert_equal current_path, search_path
  end

end
