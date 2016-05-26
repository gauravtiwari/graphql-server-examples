defmodule PhoenixGraphql.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :post_ud, references(:posts, on_delete: :nothing)

      timestamps
    end
    create index(:comments, [:user_id])
    create index(:comments, [:post_ud])

  end
end
