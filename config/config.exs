use Mix.Config

# Configures the endpoint
config :cali, CaliWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dED6eQaJRYq1qgIRPSFV9p7aczxr0AolGpn+HuGqhiBG2E//EvJX6utpoL7XQIde",
  render_errors: [view: CaliWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cali.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :cali,
  namespace: Cali,
  ecto_repos: [Cali.Repo]

# Use Jason for JSON parsing in Ecto & Phoenix
config :ecto, json_library: Jason
config :phoenix, :json_library, Jason

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
