defmodule Cali.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin

  @required ~w(email password)a
  @optional ~w()a

  schema "credentials" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    belongs_to :user, Cali.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{
    valid?: true,
    changes: %{password: password}} = changeset)
  do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
