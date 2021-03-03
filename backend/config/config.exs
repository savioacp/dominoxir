# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dominoxir,
  ecto_repos: [Dominoxir.Repo]

# Configures the endpoint
config :dominoxir, DominoxirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uLXCie8UbRxPVEX+bQYca6JobFt3XrNfY8LBToADl6Dj3W/MJBjLAwpFa/YU2o43",
  render_errors: [view: DominoxirWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Dominoxir.PubSub,
  live_view: [signing_salt: "habPHYto"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :dominoxir, Elixpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
