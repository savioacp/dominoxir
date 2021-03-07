defmodule Dominoxir.Game do
  use GenServer

  @impl true
  def init(players) do
    {:ok, players}
  end

  @impl true
  def handle_call(:init, _from, players) do
    {:ok, %{players: players}}
  end

  def new(id, players) do
    GenServer.start_link(__MODULE__, players, name: {:global, "room:#{id}"})
  end
end
