defmodule CaliWeb.PostController do
  use CaliWeb, :controller

  def show(conn, %{"slug" => slug}) do
    {:ok, post} = Cali.PostRepo.get_by_slug(slug)
    render(conn, "show.html", post: post)
  end

  def update(conn, _) do
    case Cali.PostRepo.update do
      :ok -> redirect conn, to: "/"
    end
  end

end
