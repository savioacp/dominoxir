defmodule DominoxirWeb.Guardian do
  use Guardian, otp_app: :dominoxir

  alias Dominoxir.User

  def subject_for_token(%User{} = user, _claims) do
    {:ok, user.id}
  end
  def subject_for_token(_, _) do
    {:error, :unknown_resource}
  end

  def resource_from_claims(claims) do
    {:ok, User.by_id(claims["sub"])}
  end
end
