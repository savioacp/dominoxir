defmodule Dominoxir.Login do
  defstruct [
    user: nil,
    token: nil
  ]

  import Ecto.Query
  alias Dominoxir.{Repo, User}

  def login(username, password) do

    query = from u in User, where: (u.nickname == ^username or u.email == ^username), select: u

    case Repo.all(query) do
      [] ->
        Argon2.no_user_verify()
        :error

      [%User{password_hash: hash} = user] ->
        IO.inspect user
        if Argon2.verify_pass(password, hash) do
          {:ok, user}
        else
          :error
        end

      unknown ->
        IO.inspect unknown
        :error
    end
  end
end
