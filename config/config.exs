# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, WebsocketsTerminal.Router,
  port: System.get_env("PORT"),
  ssl: false,
  code_reload: false,
  static_assets: true,
  cookies: true,
  session_key: "_websockets_terminal_key",
  session_secret: "#NH@XVPL@1QZ5_DF$_KME7D30%$ZR#6ER+77GHK(W#%8@S8B!&ZTS3P2$C1#C&Q)YWR@16C!("

config :phoenix, :logger,
  level: :error

# config :porcelain, :driver, Porcelain.Driver.Goon

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
