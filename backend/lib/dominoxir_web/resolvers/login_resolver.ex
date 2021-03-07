defmodule DominoxirWeb.Resolvers.Login do
  alias Dominoxir.{Login, Error}

  def login(_root, %{email_or_nickname: email_or_nickname, password: password}, _info) do
    case Login.login(email_or_nickname, password) do
      {:ok, user} ->
        {:ok, token, _} = DominoxirWeb.Guardian.encode_and_sign(user)
        {:ok, %Login{user: user, token: token}}
      :error -> {:ok, Error.new("Invalid credentials.")}
    end
  end
end
