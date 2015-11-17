class PaymentsController < ApplicationController
  before_action :set_subscription
  before_action :set_course

  def new
    authorize @subscription
  end

  def create
   authorize @subscription
    @amount = @subscription.amount_cents

      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email: params[:stripeEmail]
      )
      # You should store this customer id and re-use it.

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount:       @amount,  # in cents
        description:  "Payment for course #{@subscription.course.name} for subscription # #{@subscription.id}",
        currency:     'eur'
      )

      @subscription.update(payment: charge.to_json, state: 'paid')

      redirect_to course_subscription_path(@course, @subscription)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_course_subscription_payment_path(@course, @subscription)
  end

private

  def set_subscription
    @subscription = Subscription.where(state: 'pending').find(params[:subscription_id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
