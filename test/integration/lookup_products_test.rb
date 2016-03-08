require_relative '../test_helper'

class LookupProductsTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_reaches_the_root_page
    visit '/'

    fill_in 'Search for products', with: 'sennheiser'
    click_button "Search"

    assert current_path, '/search'

    save_and_open_page
  end

end