class OrdersController < ApiController
  before_action :set_order, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /orders
  def index
    @orders = Order.get_user_orders(current_user)
    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @carts = Order.get_carts_of_current_user(current_user)
    @products = get_products_from_cart(@carts)
    @total_price = get_total_paid(@products)
    @store_id = @products[0].store_id
    @user_id = @carts[0].user_id

    @order = Order.new( store_id: @store_id , total_paid: @total_price , user_id: @user_id , state_id: 1 ,coupon_id: 1)
    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.fetch(:order, {})
    end

    def get_total_paid(products)
      total=0
      products.each do |product|
        total += product.price
      end
      total
    end

    def get_products_from_cart(cart)
      products = []
      cart.each do |item|
        products.append(item.product)
      end
      products
    end

    def divide_products_according_to_store(products)
    end
end
