class Seed < ActiveRecord::Base
  attr_accessor :amount_dollars
  attr_accessible :amount_dollars
  before_save :convert_amount_to_cents

  monetize :amount_cents

  private

  def convert_amount_to_cents
    @amount_cents = @amount_dollars.to_i / 100
  end
end
