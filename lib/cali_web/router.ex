defmodule CaliWeb.Router do
  use CaliWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CaliWeb do
    pipe_through :browser # Use the default browser stack

    get "/blog/:slug", PostController, :show
    get "/update", PostController, :update
    get "/", PageController, :index

    # static pages
    get "/services", PageController, :services
    get "/services/performance-audit", PageController, :browseraudit
    get "/about", PageController, :about
    get "/uses", PageController, :uses

    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete],
                                              singleton: true

    get "/sitemap.xml", FeedController, :sitemap
  end

  # Other scopes may use custom stacks.
  # scope "/api", CaliWeb do
  #   pipe_through :api
  # end
  #
  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/sessions/new")
        |> halt()

      user_id ->
        assign(conn, :current_user, Cali.Accounts.get_user!(user_id))
    end
  end

end
