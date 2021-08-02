defmodule FindMyPersonal.Repo.Migrations.AddMemberPersonal do
  use Ecto.Migration

  def change do
    alter table(:members) do
      add :avatar_url, :string
      add :teacher_id, references(:teachers, on_delete: :delete_all)
    end
  end
end
