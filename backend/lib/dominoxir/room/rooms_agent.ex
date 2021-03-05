defmodule Dominoxir.RoomsAgent do
  use Agent

  alias Dominoxir.Room

  def start_link(opts) do
    {initial_value, _opts} = Keyword.pop(opts, :initial_value, %{})

    Agent.start_link(fn -> Map.put(initial_value, :counter, 0) end, name: __MODULE__)
  end

  def get_last_id() do
    Agent.get(__MODULE__, &Map.get(&1, :counter))
  end

  def get(id) do
    Agent.get(__MODULE__, &Map.get(&1, id))
  end

  def set(id, val) do
    Agent.update(__MODULE__, fn state ->
      Map.put(state, id, val)
    end)
  end

  @spec add(String.t()) :: integer()
  def add(name) do
    Agent.get_and_update(__MODULE__, fn state ->
      {id, new_state} = Map.get_and_update(state, :counter, &({&1 + 1, &1 + 1}))

      {id, Map.put(new_state, id, Room.new(id, name))}
    end)
  end

  def get do
    Agent.get(__MODULE__, & &1)
    |> Stream.filter(fn
      {:counter, _} -> false
      _ -> true
    end)
    |> Enum.map(fn
      {_key, val} -> val
    end)
  end
end
