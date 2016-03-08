require_relative '../test_helper'

require 'test_helper'

class Api::V1::Items

  test '#show' do

    item = Item.create(name: "item_1")

    get :show, format: :json, id: "1"

    answer = JSON.parse(response.body)
    assert_response :success
    assert_equal item.name, answer['1']
  end


end
