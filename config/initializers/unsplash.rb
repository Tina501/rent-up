Unsplash.configure do |config|
  config.application_access_key = ENV["UNSPLASH_ACCESS_KEY"]
  config.application_secret = ENV["UNSPLASH_SECRET_KEY"]
  config.application_redirect_uri = "https://localhost:3000/oauth/callback"
  config.utm_source = "tinas_terrific_student_project"
end
