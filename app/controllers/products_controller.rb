class ProductsController < ApiController
  before_action :set_product, only: [:show]

  # GET /products json
  def index
    @products = Product.search(params['query'])
    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
