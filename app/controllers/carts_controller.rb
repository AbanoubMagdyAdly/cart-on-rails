class CartsController < ApiController
  before_action :set_cart, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # GET /carts
  def index
    @carts = Cart.get_carts_of_current_user(current_user)

    render json: @carts
  end

  # GET /carts/1
  def show
    render json: @cart
  end

  # POST /carts
  def create

    @cart = Cart.find_or_initialize_by(product_id: params[:product_id], user_id: current_user.id)

    if @cart.persisted?
      if params[:increase]
        @cart.quantity += 1
      else
        @cart.quantity -= 1
        @cart.quantity = [@cart.quantity, 1].max
      end
    end

    if @cart.save
      render json: @cart, status: :created, location: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    if current_user == @cart.user
      @cart.destroy
      render :json => { response: 'Record deleted' }, status: 200
    else
      render :json => { error: 'Not authorized' }, status: :unauthorized
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      begin
        @cart = Cart.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render :json => { error: 'Record not found' }, status: :not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.fetch(:cart, {})
    end

end
