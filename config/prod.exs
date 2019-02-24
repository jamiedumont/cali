use Mix.Config

config :cali, CaliWeb.Endpoint,
  http: [port: 3232],
  url: [scheme: "https", host: "www.jamiedumont.co.uk", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: "."

config :cali, CaliWeb.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

# to start the server for all endpoints:
# If you are doing OTP releases, you need to instruct Phoenix
config :phoenix, :serve_endpoints, true
