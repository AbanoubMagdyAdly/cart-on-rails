class UsersController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user, status: :ok
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render :show, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render :show, status: :ok, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    def find_user
      @user = User.find_by_id!(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :not_found
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:name, :email, :password, :password_confirmation, :address, :avatar)
    end
end
