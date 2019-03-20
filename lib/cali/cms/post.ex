defmodule Cali.CMS.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :date, :date
    field :description, :string
    field :draft, :boolean, default: false
    field :slug, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :slug, :date, :description, :content, :draft])
    |> validate_required([:title, :slug, :date, :description, :content, :draft])
  end
end
