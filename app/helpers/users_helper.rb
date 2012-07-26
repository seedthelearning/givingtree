module UsersHelper
  def get_seed_data(seed_id)
    response = SCOOP_CLIENT.get_seed(seed_id)
  end

  def seed_amount_in_dollars(seed_id)
    response = SCOOP_CLIENT.get_seed(seed_id)
    convert_cents_to_dollars(response[:donation][:amount_cents].to_i) if response[:donation]
  end

  def seed_payout_in_dollars(seed_id)
    response = SCOOP_CLIENT.get_seed(seed_id)
    convert_cents_to_dollars(response[:donation][:payout_cents]) if response[:donation]
  end

  def seed_participant_count(seed_id)
    response = SCOOP_CLIENT.get_seed(seed_id)
    response[:participants]
  end

  def seed_total_raised(seed_id)
    response = SCOOP_CLIENT.get_seed(seed_id)
    convert_cents_to_dollars(response[:donation][:total_donated]) if response[:donation]
  end

  def convert_cents_to_dollars(amount_cents)
    amount_cents.to_i/100
  end
end
