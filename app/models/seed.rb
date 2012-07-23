class Seed < ActiveRecord::Base
  include MoneyUtil
  attr_accessor :amount_dollars
  attr_accessible :amount_dollars
  before_save :convert_amount_to_cents

  monetize :amount_cents

  private

  def convert_amount_to_cents
    @amount_cents = convert_to_cents(@amount_dollars)
  end
end
