require_relative '../test_helper'

class LookupProductsTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_reaches_the_root_page
    visit '/'
    save_and_open_page
    fill_in 'Search', with: 'sennheiser'
    click_button "Search"

    assert current_path, search_path
  end

end
