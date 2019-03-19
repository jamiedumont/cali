defmodule Cali.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add :email, :string
      add :user_id, references(:users, on_delete: :delete_all),
        null: false

      timestamps()
    end

    alter table(:users) do
      remove :email
    end

    drop_if_exists unique_index(:users, [:email])

    create unique_index(:credentials, [:email])
    create index(:credentials, [:user_id])
  end
end
