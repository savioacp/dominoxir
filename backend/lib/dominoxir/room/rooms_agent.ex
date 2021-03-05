defmodule Dominoxir.RoomsAgent do
  use Agent

  def start_link(opts) do
    {initial_value, _opts} = Keyword.pop(opts, :initial_value, %{})

    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def get(id) do
    Agent.get(__MODULE__, &Map.get(&1, id))
  end

  def set(id, val) do
    Agent.update(__MODULE__, fn state ->
      Map.put(state, id, val)
    end)
  end

  def get do
    Agent.get(__MODULE__, & &1)
    |> Enum.map(fn {_key, val} ->
      val
    end)
  end
end
