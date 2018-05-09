defmodule CaliWeb.FeedController do
  use CaliWeb, :controller

  def sitemap(conn, _params) do
    {:ok, posts} = Cali.Repo.list()

    conn
    |> put_layout(false)
    |> render("sitemap.xml", posts: posts)
  end

end
