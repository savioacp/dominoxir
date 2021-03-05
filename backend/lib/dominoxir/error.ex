defmodule Dominoxir.Error do
  defstruct error: "There was an error."

  @type t :: %{
    error: String.t()
  }

  @spec new(String.t()) :: t()
  def new(message) do
    %__MODULE__{error: message}
  end
end
