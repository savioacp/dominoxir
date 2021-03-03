# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Dominoxir.Repo.insert!(%Dominoxir.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Dominoxir.Repo
alias Dominoxir.User

User.changeset(%User{}, %{
  nickname: "savioacp",
  email: "savioacp@gmail.com",
  password: "teste1234"
})
|> Repo.insert!()
