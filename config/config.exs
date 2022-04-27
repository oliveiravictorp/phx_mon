# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :phx_mon,
  ecto_repos: [PhxMon.Repo]

# Configures the endpoint
config :phx_mon, PhxMonWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PhxMonWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PhxMon.PubSub,
  live_view: [signing_salt: "6g0JP50i"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :phx_mon, PhxMon.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

config :phx_mon, PhxMonWeb.Auth.Guardian,
  issuer: "phx_mon",
  secret_key: "edXFGe7vc3d02Bo4M/O/QxXKmec73HshcVk8iiSDcuviRifz/DzinrduDGXfGJ/p"

config :phx_mon, PhxMonWeb.Auth.Pipeline,
  module: PhxMonWeb.Auth.Guardian,
  error_handler: PhxMonWeb.Auth.ErrorHandler
