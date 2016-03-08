require "test_helper"

class Api::V1::ItemsControllerTest < ActionController::TestCase
  
  def test_show
    item = Item.create(name: "item_1")

    get :show, format: :json, id: "1"

    answer = JSON.parse(response.body)
    assert_response :success
    assert_equal item.name, answer['1']
  end

  def test_index

    items = 3.times do |t|
      Item.create(name: "item_#{t}")
    end

    get :index, format: :json

    answer = JSON.parse(response.body)
    assert_response :success
    3.times do |t|
      assert_equal items[t].name, answer["item_#{t}"]
    end
  end

end
