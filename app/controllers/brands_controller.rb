class BrandsController < ApiController
  before_action :set_brand, only: [:show]

  # GET /brands json
  def index
    @brands = Brand.all
    render json: @brands
  end

  # GET /brands/1
  def show
    render json: @brand
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end
end
