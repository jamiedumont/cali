defmodule CaliWeb.PageController do
  use CaliWeb, :controller


  def action(conn, _) do
    case action_name(conn) do
      :index -> index(conn, conn.params)
      name -> render(conn, name)
    end
  end

  def index(conn, _) do
    posts = Cali.CMS.list_posts()
    render conn, "index.html", posts: posts
  end

end
