defmodule Param do
  use GenServer

  def start_link(%{next: next}) do
    GenServer.start_link(__MODULE__, next, name: __MODULE__)
  end

  def init(next) do
    {:ok, %{next: next}}
  end

  def notify(message) do
    GenServer.cast(__MODULE__, {:notify, message})
  end

  def handle_cast({:notify, message}, state = %{next: next}) do
    send(next, message)
    {:noreply, state}
  end
end

defmodule ParamN do
  require Logger

  def spawn() do
    spawn(__MODULE__, :loop, [])
  end

  def loop() do
    receive do
      msg -> Logger.info(msg)
    end
  end
end
