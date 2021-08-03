# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :find_my_personal,
  ecto_repos: [FindMyPersonal.Repo]

# Configures the endpoint
config :find_my_personal, FindMyPersonalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iWa4RxjYC78jP0cFQYH1iga9dNy6QTQEFi5mDnoR0EoVj2miEdAw3rOrzaOlUEfa",
  render_errors: [view: FindMyPersonalWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FindMyPersonal.PubSub,
  live_view: [signing_salt: "1JSHkMNN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :find_my_personal, FindMyPersonal.Mail.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "SERVER_HOST_MAIL",
  hostname: "SERVER_HOST_MAIL",
  port: "PORT_MAIL",
  username: "USER_NAME_MAIL",
  password: "PASSWORD_MAIL",
  tls: :if_available,
  allowed_tls_versions: [:tlsv1, :"tlsv1.1", :"tlsv1.2"],
  tls_log_level: :error,
  tls_verify: :verify_peer,
  tls_cacertfile: "/somewhere/on/disk",
  tls_cacerts: "…",
  tls_depth: 3,
  tls_verify_fun: {&:ssl_verify_hostname.verify_fun/3, check_hostname: "example.com"},
  ssl: false,
  retries: 1,
  no_mx_lookups: false,
  auth: :cram_md5

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
