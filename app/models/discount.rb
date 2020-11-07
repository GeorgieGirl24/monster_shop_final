class Discount < ApplicationRecord
  validates_presence_of :description
  validates_presence_of :quantity
  validates_presence_of :percent
  validates_presence_of :enable
end
