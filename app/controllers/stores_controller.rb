class StoresController < ApiController
  before_action :set_store, only: [:show]

  # GET /stores json
  def index
    @stores = Store.all
    render json: @stores
  end

  # GET /stores/1
  def show
    render json: @store
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end
end
