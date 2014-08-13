defmodule WebsocketsTerminal.Channels.Shell do
  use Phoenix.Channel

  def join(socket, "shell", _message) do
    IO.puts "JOIN #{socket.channel}.#{socket.topic}"
    reply socket, "join", %{status: "REMOTE IEX TERMINAL READY", version: System.version()}
    {:ok, socket}
  end

  def join(socket, _private_topic, _message) do
    {:error, socket, :unauthorized}
  end

  def event(socket, "shell:stdin", message) do
    WebsocketsTerminal.ShellServer.eval(:shell, message["data"])
    socket
  end
end
