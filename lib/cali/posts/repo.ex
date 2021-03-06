defmodule Cali.PostRepo do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  def init(:ok) do
    posts = Cali.Crawler.crawl
    {:ok, posts}
  end

  def get_by_slug(slug) do
    GenServer.call(__MODULE__, {:get_by_slug, slug})
  end

  def list() do
    GenServer.call(__MODULE__, {:list})
  end

  def list_with_drafts() do
    GenServer.call(__MODULE__, {:list_with_drafts})
  end

  def all_titles() do
    GenServer.call(__MODULE__, {:all_titles})
  end

  def count() do
    GenServer.call(__MODULE__, {:count})
  end

  def update() do
    GenServer.call(__MODULE__, {:update})
  end

  def handle_call({:get_by_slug, slug}, _from, posts) do
    case Enum.find(posts, fn(x) -> x.slug == slug end) do
      nil -> {:reply, :not_found, posts}
      post -> {:reply, {:ok, post}, posts}
    end
  end

  def handle_call({:list}, _from , posts) do
    live_posts =
      posts
      |> Enum.reject(fn(x) -> x.draft == "true" end)

    {:reply, {:ok, live_posts}, posts}
  end

  def handle_call({:list_with_drafts}, _from , posts) do
    {:reply, {:ok, posts}, posts}
  end

  def handle_call({:all_titles}, _from, posts) do
    titles =
      posts
      |> Enum.map(fn(x) -> x.title end)

    {:reply, {:ok, titles}, posts}
  end

  def handle_call({:count}, _from , posts) do
    count = Enum.count(posts)
    {:reply, {:ok, count}, posts}
  end

  def handle_call({:update}, _from, _posts) do
    new_posts = Cali.Crawler.crawl
    {:reply, :ok, new_posts}
  end

end
