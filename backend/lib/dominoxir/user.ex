defmodule Dominoxir.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :email, :string
    field :nickname, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :wins, :integer, default: 0

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nickname, :email, :wins, :password])
    |> validate_required([:nickname, :email, :password, :wins])
    |> validate_nickname()
    |> validate_email()
    |> validate_wins()
    |> put_password_hash()
  end

  defp validate_email(changeset) do
    changeset
    |> validate_format(
      :email,
      ~r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"u
    )  # regex from https://html.spec.whatwg.org/multipage/input.html#valid-e-mail-address
    |> unique_constraint(:email)
  end

  defp validate_nickname(changeset) do
    changeset
    |> validate_length(:nickname, min: 3, max: 16)
    |> unique_constraint(:nickname)
  end

  defp validate_wins(changeset) do
    changeset
    |> validate_number(:wins, greater_than_or_equal_to: 0)
  end


  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
    |> change(Argon2.add_hash(password))
  end
  defp put_password_hash(changeset), do: changeset
end
