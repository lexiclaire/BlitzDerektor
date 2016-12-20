# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :http_api,
  ecto_repos: [HttpApi.Repo]

# Configures the endpoint
config :http_api, HttpApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vdwm2o3sKQF21S5zoEgm3LcsXSqFXRLcbLvll4QO6TQpQD0r4anqd5e0FxnjbNw/",
  render_errors: [view: HttpApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: HttpApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
