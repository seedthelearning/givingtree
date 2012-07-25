module Support::Scooper
  include MoneyUtil

  def create_seed(user_id, amount_dollars)
    response = SCOOP_CLIENT.create_seed(user_id, convert_to_cents(amount_dollars))
    Seed.create(amount_dollars: amount_dollars, link: response["link"])
    response
  end

  def create_participant(user_id, seed_id)
    SCOOP_CLIENT.create_participant(user_id, seed_id)
  end

  def create_reseed(user_id, seed_id, amount_dollars)
    response = SCOOP_CLIENT.reseed_seed(user_id, seed_id, convert_to_cents(amount_dollars))
    Seed.create(amount_dollars: amount_dollars, link: response["link"])
    response
  end
end
