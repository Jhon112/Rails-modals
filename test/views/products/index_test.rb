require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest
    
    def setup
        @product = Product.create(name: "Papas", price: 3000)
    end

    test "Index render correctly" do
        
        sign_in users(:ja)
        get products_path
        assert_select "h1", "Products"
        assert_select "a", "Nuevo Producto"
        assert_select "th", "Nombre"
        assert_select "th", "Precio"
        assert_select "td", "#{@product.name}"
        assert_select "td", "$200.00"
    end

    test "Index only shows products with published true" do
        get products_path
        assert_select "tr", {:count => 2, :text => @product.published}
    end

end