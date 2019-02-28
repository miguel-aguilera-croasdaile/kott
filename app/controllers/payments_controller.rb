require "stripe"

class PaymentsController < ApplicationController
  before_action :set_order
  skip_before_action :set_order, only: [:show]


  def new
    @product = @order.product
    @payment = Payment.new
  end

  def show
  end

  def create
    Stripe.api_key = "sk_test_gUiYMO900i2lgRID2xLTn9Ov"

    @payment = Payment.new(payment_params)
    @payment.order = @order
    @payment.user = current_user

    token = params[:stripeToken]

    stripe_charge = Stripe::Charge.create(
      amount: @order.product.purchase_total_price_cents,
      currency: @order.product.purchase_total_price_currency,
      source: token,
      description: "Charge for purchase of #{@order.product.quantity} #{@order.product.unit.pluralize} of #{@order.product.grade} #{@order.product.name} coffee beans"
      )

    @payment.stripe_charge_id = stripe_charge[:id]
    @payment.save!

    @order.update_attribute(:status, 'Paid')
    redirect_to order_path(@order)
  end

  def shoe
  end

  private

  def set_order
    @order = current_user.orders.find(params[:order_id])
  end

  def payment_params
    params.require(:payment).permit(
      :billing_email,
      :billing_first_name,
      :billing_last_name,
      :billing_address,
      :billing_city,
      :billing_country,
      :billing_zip_code,
      )
  end

end

