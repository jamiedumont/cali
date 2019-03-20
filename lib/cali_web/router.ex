defmodule CaliWeb.Router do
  use CaliWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug CaliWeb.Plug.SetCurrentUser, repo: Cali.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticate_user do
    plug CaliWeb.Plug.AuthenticateUser
  end


  scope "/cp", CaliWeb.Admin, as: :admin do
    pipe_through [:browser, :authenticate_user]

    resources "/posts", PostController, only: [:index, :edit, :update]


  end

  scope "/", CaliWeb do
    pipe_through :browser # Use the default browser stack

    get "/blog/:slug", PostController, :show
    get "/", PageController, :index

    # static pages
    get "/services", PageController, :services
    get "/services/performance-audit", PageController, :browseraudit
    get "/about", PageController, :about
    get "/uses", PageController, :uses

    resources "/users", UserController, only: [:show, :edit, :update]

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete

    get "/sitemap.xml", FeedController, :sitemap
  end

  # Other scopes may use custom stacks.
  # scope "/api", CaliWeb do
  #   pipe_through :api
  # end
  #
end
