class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
   before_filter :authenticate_user!

  respond_to :html

  def sales
    @orders = Order.all.where(seller: current_user).order("created_at DESC")
  end
  
  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end
  
  def index
    @orders = Order.all
  end

  def show
    respond_with(@order)
  end

  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])

  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @listing = Listing.find(params[:listing_id])
    @seller = @listing.user
    
    @order.listing_id = @listing.id
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
end
