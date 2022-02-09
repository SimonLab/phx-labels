import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phx_labels, PhxLabelsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Wtrf7pm8rbXgPD5AclC1i5lVQSTAP7RIfrJnXSDNBNSKKDlk23OgRTX7pGwH3+3k",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
