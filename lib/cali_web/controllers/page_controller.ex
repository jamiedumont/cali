defmodule CaliWeb.PageController do
  use CaliWeb, :controller

  def index(conn, _params) do
    {:ok, posts} = Cali.Repo.list()
    render conn, "index.html", posts: posts
  end
end
