class CategoriesController < ApiController
  before_action :set_category, only: [:show]

  # GET /categories json
  def index
    @categories = Category.all
    render json: @categories
  end

  # GET /categories/1
  def show
    render json: @category
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
end
