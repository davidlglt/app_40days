class AddStateAmountPaymentToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :state, :string
    add_monetize :subscriptions, :amount, currency: { present: false }
    add_column :subscriptions, :payment, :json
  end
end
