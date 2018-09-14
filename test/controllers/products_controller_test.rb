require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  
  # test "post create: Creates a product" do
  #   assert_difference 'Product.count', 1 do
  #     post products_path, params: { product: { name: "product 1", published: true, price: 100, costo: 50, quantity: 2}}
  #   end

  # end

  test "get index: is sucessful" do
    sign_in users(:ja)
    get products_path
    assert_response :success
  end

  test "is refirected to login if user is not authenticated" do
    get products_path
    assert_response :redirect
  end

end
