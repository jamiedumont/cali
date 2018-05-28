defmodule CaliWeb.PageController do
  use CaliWeb, :controller


  def action(conn, _) do
    case action_name(conn) do
      :index -> index(conn, conn.params)
      name -> render(conn, name)
    end
  end

  def index(conn, _) do
    {:ok, posts} = Cali.PostRepo.list()
    render conn, "index.html", posts: posts
  end

  def services(conn, _) do
    render conn, "services.html"
  end

  def browseraudit(conn, _) do
    render conn, "browseraudit.html"
  end

end
