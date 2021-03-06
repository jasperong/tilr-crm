require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
  importer :facebook, ENV["FB_CLIENT_ID"], ENV["FB_CLIENT_SECRET"]

  # Linkedin does not allow getting contacts anymore i guess
  # importer :linkedin, ENV["LINKEDIN_ID"], ENV["LINKEDIN_SECRET"], { state: "DCEeFWf45A53sdfKef424" }
end
