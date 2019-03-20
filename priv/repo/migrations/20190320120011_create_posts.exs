defmodule Cali.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :slug, :string
      add :date, :date
      add :description, :string
      add :content, :text
      add :draft, :boolean, default: false, null: false

      timestamps()
    end

  end
end
