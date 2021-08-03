defmodule FindMyPersonalWeb.Api.TeacherView do
  use FindMyPersonalWeb, :view
  alias FindMyPersonal.Repo
  alias FindMyPersonalWeb.Api.MemberView

  def render("index.json", %{teachers: teachers}) do
    %{data: render_many(teachers, __MODULE__, "teacher.json")}
  end

  def render("show.json", %{teacher: teacher}) do
    %{data: render_one(teacher, __MODULE__, "teacher.json")}
  end

  def render("teacher.json", %{teacher: teacher}) do
    teacher = teacher |> Repo.preload(:members)
    members = teacher.members
    total_members = members |> Enum.count

    %{
      id: teacher.id,
      avatar_url: teacher.avatar_url,
      name: teacher.name,
      birth_date: teacher.birth_date,
      education_level: teacher.education_level,
      class_type: teacher.class_type,
      members: MemberView.render("index.json", members: members),
      total_members: total_members
    }
  end
end
