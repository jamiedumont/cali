defmodule Cali.Crawler do

  def crawl do
    File.ls!("priv/posts")
    |> Enum.map(&Cali.Post.compile/1)
    |> Enum.sort(&sort/2)
  end

  def sort(a, b) do
    Timex.compare(a.date, b.date) > 0
  end
end
