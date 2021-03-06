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

    get "/sitemap.xml", FeedController, :sitemap
  end

  # Other scopes may use custom stacks.
  # scope "/api", CaliWeb do
  #   pipe_through :api
  # end
end
