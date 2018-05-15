defmodule Cali.Analytics.PageView do
  use Ecto.Schema
  import Ecto.Changeset
  alias Cali.Analytics.PageView

  schema "pageview" do
    field :referer
    field :datetime, :utc_datetime
    field :page
  end

  def changeset(%PageView{} = pageview, attrs \\ %{}) do
    pageview
    |> cast(attrs, [:page, :referer, :datetime])
    |> validate_required([:page, :datetime])
  end

end
