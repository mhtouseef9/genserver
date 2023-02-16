import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :persist_state, PersistStateWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Kqleolormyh2nWbD1E7vq4qmo1HpPskxAAXDMLwydlR2+NMVzSe5tiIKL/w4smcj",
  server: false

# In test we don't send emails.
config :persist_state, PersistState.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
