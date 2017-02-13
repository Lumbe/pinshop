# frozen_string_literal: true
SMTP_SETTINGS = {
  address:              ENV.fetch(PINSHOP_SMTP_ADDRESS), # example: "smtp.sendgrid.net"
  authentication:       :plain,
  domain:               ENV.fetch(PINSHOP_SMTP_DOMAIN), # example: "heroku.com"
  enable_starttls_auto: true,
  password:             ENV.fetch(PINSHOP_SMTP_PASSWORD),
  port:                 ENV.fetch(PINSHOP_SMTP_PORT),
  user_name:            ENV.fetch(PINSHOP_SMTP_USERNAME)
}.freeze
