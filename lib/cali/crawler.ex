defmodule Cali.Crawler do

  def crawl do
    File.ls!(Application.app_dir(:cali, "priv/posts"))
    |> filter_markdown_files
    |> Enum.map(&Cali.Post.compile/1)
    |> Enum.sort(&sort/2)
  end

  def populate_db do
    File.ls!(Application.app_dir(:cali, "priv/posts"))
    |> filter_markdown_files
    |> IO.inspect()
    |> Enum.map(&Cali.Post.compile/1)
    |> Enum.map(&Cali.CMS.create_post/1)
  end


  def sort(a, b) do
    Timex.compare(a.date, b.date) > 0
  end

  # Only return markdown files (.DS_Store causing issues)
  def filter_markdown_files(list) do
    Enum.filter(list, fn(p) -> Regex.match?(~r/.md/, p) end)
  end

end
