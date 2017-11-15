class Question < ApplicationRecord
  belongs_to :store_campaign
  has_many :poll_answer, :dependent => :destroy
end
