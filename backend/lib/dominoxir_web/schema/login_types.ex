defmodule DominoxirWeb.Schema.LoginTypes do
  use Absinthe.Schema.Notation

  object :login do
    field :token, :string
  end

  union :login_response do

    types [:user, :error, :login]
  end


  object :login_mutations do
    field :login, :login_response do
      arg :email_or_nickname, :string
      arg :password, :string
    end
  end
end
