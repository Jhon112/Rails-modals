class Api::V1::ProductsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :basic_auth

  def index
    @products = Product.all
    render json: @products
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product
    else
      render json: { errors: product.errors }, status: 422
    end
  end

    def destroy
    product = Product.find(params[:id])
    product.destroy

    head :no_content
  end

  private
    def product_params 
      params.require(:product).permit(:name, :price, :published)
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, token| 
      #   # Veridicar user y password.
      
      # user == "jhon" && password == "1234"
      user = User.find_by_email(username)
        if user.auth_token == token          
          sign_in user
        end

      end
    end
end
