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
    @products_quantities = get_products_quantities_from_cart(@carts)
    @products = @products_quantities[0]
    @quantities = @products_quantities[1]
    @total_price = get_total_paid(@products , @quantities)
    @store_id = @products[0].store_id
    @user_id = @carts[0].user_id
    @coupon = Order.get_coupon(params[:coupon_code])
    @total_paid = Coupon.discounted_price(@total_price , params[:coupon_code] , current_user.id)
    if @coupon != nil
       @order = Order.new( store_id: @store_id , total_paid: @total_paid , user_id: @user_id , state_id: 1 ,coupon_id: @coupon.id )
    else 
       @order = Order.new( store_id: @store_id , total_paid: @total_paid , user_id: @user_id , state_id: 1 )
    end
    if @order.save
      @order.products << @products
      @carts.delete_all()
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

    def get_total_paid(products, quantities)
      total=0
      products.zip(quantities).each do |product , quantity|
        total += product.price  * quantity
      end
      total
    end

    def get_products_quantities_from_cart(cart)
      products = []
      quantities = []
      cart.each do |item|
        products.append(item.product)
        quantities.append(item.quantity)
      end
      [ products , quantities ]
    end

    def divide_products_according_to_store(products)
    end
end
