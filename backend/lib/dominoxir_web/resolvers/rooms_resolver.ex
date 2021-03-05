defmodule DominoxirWeb.Resolvers.Rooms do
  alias Dominoxir.RoomsAgent, as: Rooms

  alias Dominoxir.Room

  def get_all(_root, _params, _info) do
    {:ok, Rooms.get()}
  end

  def get_one(_root, %{id: id}, _info) do
    {:ok, Rooms.get(id)}
  end

  def create(_root, %{name: name}, _info) do
    id = Rooms.add name

    {:ok, Rooms.get(id)}
  end
end
