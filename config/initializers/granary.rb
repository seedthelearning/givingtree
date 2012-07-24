if Rails.env == 'production'
  GRANARY_URL = "http://50.116.37.154:8080/granary/api/v1/"
else
  GRANARY_URL = "http://localhost:3001/api/v1/"
end
