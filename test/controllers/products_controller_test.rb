require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  
  test "post create: Creates a product" do
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name: "product 1", published: true, price: 100, costo: 50, quantity: 2}}
    end

  end




end
