defmodule WebsocketsTerminal.ShellServer do
  alias Porcelain.Process, as: Proc

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def eval(server, command) do
    GenServer.cast(server, {:eval, command})
  end

  # gen server callbacks
  def init(:ok) do
    proc = Porcelain.spawn_shell("iex", in: :receive, out: {:send, self()})
    {:ok, proc}
  end

  def handle_cast({:eval, command}, proc) do
    Proc.send_input(proc, "#{command}\n")
    {:noreply, proc}
  end

  def handle_info({_pid, :data, data}, proc) do
    IO.inspect data
    data = strip_ansi(data)
    IO.inspect(data)

    Phoenix.Channel.broadcast "shell", "shell", "stdout", %{data: Base.encode64(data)}
    {:noreply, proc}
  end

  def handle_info(noclue, proc) do
    IO.puts "unhandled info"
    IO.inspect noclue
    {:noreply, proc}
  end

  defp strip_ansi(string) do
    string
    |> strip_line
    |> remove_iex
    |> strip_continuation
    |> String.strip
  end

  defp strip_continuation(string) do
    Regex.replace(~r/\(\d*\)\> /, string, "")
  end

  defp strip_line(string) do
    Regex.replace ~r/1>\s+/i, string, ""
  end

  defp remove_iex(string) do
    Regex.replace ~r/iex\(\d+\)>/, string, ""
  end
end
