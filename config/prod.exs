use Mix.Config

config :phoenix, WebsocketsTerminal.Router,
  port: System.get_env("PORT"),
  ssl: false,
  code_reload: false,
  cookies: true,
  session_key: "_websockets_terminal_key",
  session_secret: "#NH@XVPL@1QZ5_DF$_KME7D30%$ZR#6ER+77GHK(W#%8@S8B!&ZTS3P2$C1#C&Q)YWR@16C!("

config :phoenix, :logger,
  level: :error

# config :porcelain, :driver, Porcelain.Driver.Basic

