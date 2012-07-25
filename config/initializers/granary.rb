if Rails.env == 'production'
  GRANARY_URL = "http://seedthelearning.herokuapp.com/api/v1/"
else
  GRANARY_URL = "http://localhost:3001/api/v1/"
end
