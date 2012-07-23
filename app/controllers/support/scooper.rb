module Support::Scooper
  include MoneyUtil

  def create_seed(user_id, amount_dollars)
    Seed.create(amount_dollars: amount_dollars)
    SCOOP_CLIENT.create_seed(user_id, convert_to_cents(amount_dollars))
  end
end
