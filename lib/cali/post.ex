defmodule Cali.Post do

  defstruct slug: "", title: "", date: "", description: "", body: "", draft: false

  def compile(file) do
    post = %Cali.Post{
      slug: file_to_slug(file)
    }

    Path.join([Application.app_dir(:cali, "priv/posts"), file])
    |> File.read!
    |> split
    |> extract(post)
  end

  defp file_to_slug(file) do
    String.replace(file, ~r/\.md$/, "")
  end

  defp split(data) do
    [frontmatter, markdown] = String.split(data, ~r/\n-{3,}\n/, parts: 2)
    {parse_yaml(frontmatter), Earmark.as_html!(markdown)}
  end

  defp parse_yaml(yaml) do
    [parsed] = :yamerl_constr.string(yaml)
    parsed
  end

  defp extract({props, body}, post) do
    %{post |
      title: get_prop(props, "title"),
      date: Timex.parse!(get_prop(props, "date"), "{ISOdate}"),
      description: get_prop(props, "description"),
      draft: get_prop(props, "draft"),
      body: body,
    }
  end

  defp get_prop(props, key) do
    case :proplists.get_value(String.to_charlist(key), props) do
      :undefined -> nil
      x -> to_string(x)
    end
  end


end
