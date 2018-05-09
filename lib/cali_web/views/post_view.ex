defmodule CaliWeb.PostView do
  use CaliWeb, :view
  import Phoenix.Controller, only: [current_url: 2]

  def render("meta.show.html", assigns) do
    ~E{
      <!-- Meta data -->
      <title><%= assigns.post.title %> - Jamie Dumont</title>
      <meta
        name="description"
        content="<%= assigns.post.description %>"
      >

      <!-- Open Graph data -->
      <meta property="og:title" content="<%= assigns.post.title %>" />
      <meta property="og:type" content="article" />
      <meta property="og:description" content="<%= assigns.post.description %>" />

      <!-- Twitter Card -->
      <meta name="twitter:title" content="<%= assigns.post.title %>" />
      <meta name="twitter:description" content="<%= assigns.post.description %>" />
    }
  end
end
