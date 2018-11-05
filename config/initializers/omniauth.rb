# Replace API_KEY and API_SECRET with the values you got from Twitter
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "CvIH2tDc8w9DniK9HGoyZfH7T", "eQi8tjUzeg1kaLg9ychjYVZIVrTwN6AYabmgjSYak7rCMbn4VP"
end