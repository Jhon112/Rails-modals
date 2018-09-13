require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @product1 = products(:product1)
    @product2 = products(:product2)
    
  end

  test "Product is not created without name" do
    product = Product.new
    assert_equal false, product.save
  end

  test ".word_count returns the correct number of wors in name" do
    assert_equal 1, @product1.word_count
  end

  test "Published scope only returns published Products" do
    products = Product.published
    assert_equal 2, products.length
  end

  # haga un test qu pruebe que el metodo 'margen' calcule correctamente el margen de los productos(agregar el campo costo)
  test ".margen calculates the margen of the products correctly" do
    assert_equal 1, @product1.margen

  end

  test ".stock_status returns if a product is available" do
    assert_equal true, @product1.stock_status
    assert_equal false, @product2.stock_status

  end





end
