require './config/secret/stripe_keys'

if Rails.env == 'production'
  Stripe.api_key = STRIPE_LIVE_SECRET
  STRIPE_PUBLIC = STRIPE_LIVE_PUBLIC
else
  Stripe.api_key = STRIPE_TEST_SECRET
  STRIPE_PUBLIC = STRIPE_TEST_PUBLIC
end
