defmodule WebsocketsTerminal.ShellServer do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def eval(server, command) do
    GenServer.cast(server, {:eval, command})
  end

  # gen server callbacks
  def init(:ok) do
    proc = WebsocketsTerminal.Eval.start
    {:ok, proc}
  end

  def handle_info(noclue,proc) do
    {:noreply, proc}
  end

  def handle_cast({:eval, command}, proc) do
    unless Process.alive? proc do
      proc = WebsocketsTerminal.Eval.start
    end

    send(proc, {self, {:input, command}})

    resp = receive do
      response ->
        data = format_json(response)
        Phoenix.Channel.broadcast "shell", "shell", "stdout", data
    end

    {:noreply, proc}
  end

  defp format_json({prompt, {type, result}}) do
    # show double-quotes in strings
    result = Inspect.BitString.escape(inspect(result), ?")
    ~s/{"prompt":"#{prompt}","type":"#{type}","result":"#{result}"}/
  end

end
