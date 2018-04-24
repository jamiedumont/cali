defmodule CaliWeb.PostController do
  use CaliWeb, :controller

  def show(conn, %{"slug" => slug}) do
    case Cali.Repo.get_by_slug(slug) do
      {:ok, post} -> render conn, "show.html", post: post
      :not_found -> not_found(conn)
    end
  end

  def update(conn, _) do
    case Cali.Repo.update do
      :ok -> redirect conn, to: "/"
    end
  end

  def not_found(conn) do
    conn
    |> put_status(:not_found)
    |> render(CaliWeb.ErrorView, "404.html")
  end
end
