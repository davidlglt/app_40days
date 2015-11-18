class Score < ActiveRecord::Base
  belongs_to :word
  belongs_to :user
end

