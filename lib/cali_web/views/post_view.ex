defmodule CaliWeb.PostView do
  use CaliWeb, :view

  def render("meta.show.html", assigns) do
    ~E{
      <title><%= assigns.post.title %> - Jamie Dumont</title>
      <meta
        name="description"
        content="<%= assigns.post.description %>"
      >
      <link rel="canonical" href="<%= render_canonical(assigns.conn.path_info) %>" />
    }
  end
end
