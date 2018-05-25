defmodule Cali.Repo.Migrations.CreatePageview do
  use Ecto.Migration

  def change do

    create table(:pageview) do
      add :page, :string
      add :referer, :string
      add :datetime, :utc_datetime
    end

  end
end
