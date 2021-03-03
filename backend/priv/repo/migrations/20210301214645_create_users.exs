defmodule Dominoxir.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nickname, :string
      add :email, :string
      add :password_hash, :string
      add :wins, :integer

      timestamps()
    end

    create unique_index(:users, [:nickname])
    create unique_index(:users, [:email])
  end
end
