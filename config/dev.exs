use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :cali, CaliWeb.Endpoint,
  http: [port: 4000],
  url: [scheme: "http", host: "178.62.82.117", port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [npm: ["run", "watch",
                    cd: Path.expand("../assets", __DIR__)]]

config :cali, Cali.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "cali_dev",
  username: "postgres",
  password: "postgres",
  port: "5432"

# Watch static and templates for browser reloading.
config :cali, CaliWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/cali_web/views/.*(ex)$},
      ~r{lib/cali_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20
