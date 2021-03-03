defmodule DominoxirWeb.Resolvers.UsersResolver do
  import Ecto.Query, only: [from: 2]

  alias Dominoxir.{Repo, User}

  def get_one(_root, %{id: id}, _info) do
    {:ok, case Repo.all(from(u in User, where: u.id == ^id)) do
      [user] -> user
      [] -> %{error: "User does not exist :("}
    end}
  end

  def get_all(_root, _args, _info) do
    {:ok, Repo.all(User)}
  end
end
