defmodule DominoxirWeb.Schema.LoginTypes do
  use Absinthe.Schema.Notation

  alias DominoxirWeb.Resolvers.Login, as: LoginResolver
  alias Dominoxir.{Login, Error}

  object :login do
    field :user, :user
    field :token, :string
  end

  union :login_response do
    description "Result of a login attempt."

    types [:login, :error]

    resolve_type fn
      %Login{}, _ -> :login
      %Error{}, _ -> :error
    end
  end


  object :login_queries do
    field :login, :login_response do
      arg :email_or_nickname, :string
      arg :password, :string

      resolve &LoginResolver.login/3
    end
  end
end
