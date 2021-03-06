# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :location_chat_app,
  ecto_repos: [LocationChatApp.Repo]

config :geo_postgis,
  json_library: Jason # If you want to set your JSON module

# Configures the endpoint
config :location_chat_app, LocationChatAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zefV7ScwPNiLkd2CV1I9kalO+xWNERXpPNpP+DPnXjcXZm2trEvVjsKHgJhN6Eqa",
  render_errors: [view: LocationChatAppWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: LocationChatApp.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "09c/Yl9J"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
