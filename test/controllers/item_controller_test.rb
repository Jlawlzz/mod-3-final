require "test_helper"

class Api::V1::ItemsControllerTest < ActionController::TestCase

  def test_show
    item = Item.create(name: "item_1", description: "thing_1", image_url: "1")

    get :show, format: :json, id: "1"

    answer = JSON.parse(response.body)
    assert_response :success
    assert_equal item.name, answer['name']
    assert_equal item.description, answer['description']
    assert_equal item.image_url, answer['image_url']

  end

  def test_index

    items = []
    3.times do |t|
      items << Item.create(name: "item_#{t}", description: "thing_#{t}", image_url: "#{t}")
    end

    get :index, format: :json

    answer = JSON.parse(response.body)
    assert_response :success
    3.times do |t|
      assert_equal items[t].name, answer[t]['name']
    end
  end

  def test_delete
    item = Item.create(name: "item_1", description: "thing_1", image_url: "1")
    item_2 = Item.create(name: "item_2", description: "thing_2", image_url: "2")

    get :destroy, format: :json, id: "1"

    answer = JSON.parse(response.body)
    assert_response :success
    assert_equal item.name, answer['name']
    assert_equal item.description, answer['description']
    assert_equal item.image_url, answer['image_url']
    assert_equal Item.all.count, 1

  end

  def test_delete
    item = Item.create(name: "item_1", description: "thing_1", image_url: "1")

    post :create, format: :json, item: {name: "thing_2",
                                     description: "it does a thing",
                                     image_url: "blah"}

    answer = JSON.parse(response.body)
    assert_response :success
    assert_equal "thing_2", answer['name']
    assert_equal "it does a thing", answer['description']
    assert_equal "blah", answer['image_url']
    assert_equal Item.all.count, 2

  end


end
