defmodule Cali.Repo.Migrations.PageviewAddition do
  use Ecto.Migration

  def change do

    alter table(:pageview) do
      add :internal_referer, :boolean
    end

  end
end
