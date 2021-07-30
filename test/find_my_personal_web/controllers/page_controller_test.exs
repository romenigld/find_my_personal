defmodule FindMyPersonalWeb.PageControllerTest do
  use FindMyPersonalWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert redirected_to(conn) == Routes.teacher_path(conn, :index)
    conn = get(conn, Routes.teacher_path(conn, :index))
    assert html_response(conn, 200) =~ "Instrutores"
  end
end
