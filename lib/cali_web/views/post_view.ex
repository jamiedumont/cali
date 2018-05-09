defmodule CaliWeb.PostView do
  use CaliWeb, :view
  import Phoenix.Controller, only: [current_url: 2]

  def render("meta.show.html", assigns) do
    ~E{
      <title><%= assigns.post.title %> - Jamie Dumont</title>
      <meta
        name="description"
        content="<%= assigns.post.description %>"
      >
      <link rel="canonical" href="<%= current_url(assigns.conn, %{\}) %>" />
    }
  end
end
