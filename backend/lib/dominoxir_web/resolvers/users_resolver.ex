defmodule DominoxirWeb.Resolvers.Users do
  import Ecto.Query, only: [from: 2]

  alias Dominoxir.{Repo, User, Error}

  def get_one(_root, %{id: id}, _info) do
    {:ok, case Repo.all(from(u in User, where: u.id == ^id)) do
      [user] -> user
      [] -> Error.new("User does not exist :(")
    end}
  end

  def get_all(_root, _args, _info) do
    {:ok, Repo.all(User)}
  end

  def get_me(_root, _args, %{context: %{user: current_user}}) do
    IO.inspect current_user
    {:ok, current_user}
  end
  def get_me(_,_,_) do
    {:ok, Error.new("You must be logged in to get your profile")}
  end
end
