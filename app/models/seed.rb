class Seed < ActiveRecord::Base
  attr_accessible :amount_cents, :amount
  attr_accessor :amount

  before_save :amount_to_cents

  def amount_to_cents
    @amount_cents = @amount / 100
  end
end
