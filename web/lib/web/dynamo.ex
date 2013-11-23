defmodule Web.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated with this Dynamo
    otp_app: :web,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from which static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/static"

  # Uncomment the lines below to enable the cookie session store
  # config :dynamo,
  #   session_store: Session.CookieStore,
  #   session_options:
  #     [ key: "_web_session",
  #       secret: "nfP2Ada6vMx+dAoCG2aGXe0qkvf1KezifxM7rScH3LQzYxdz20GPd/Pl0d5wF3fm"]

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
  end
end
