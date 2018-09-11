class ProductsController < ApplicationController
  def index
  end

  def alert_js
    
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
  end



  private
    def product_params 
      params.requite(:product).permit(:name, :price)
    end


end
