defmodule FindMyPersonalWeb.PageController do
  use FindMyPersonalWeb, :controller

  def index(conn, _params) do
    conn
    |> redirect(to: Routes.teacher_path(conn, :index))
  end
end
