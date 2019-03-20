defmodule CaliWeb.PostController do
  use CaliWeb, :controller

  def show(conn, %{"slug" => slug}) do
    IO.inspect(conn.private)
    post = Cali.CMS.get_post_by_slug(slug)
    render(conn, "show.html", post: post)
  end

end
