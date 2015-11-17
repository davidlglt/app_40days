class Subscription < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  monetize :amount_cents

end
