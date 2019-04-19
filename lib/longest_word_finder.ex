defmodule LongestWordFinder do
  def concurrent_run() do
    load_corpus()
    |> Flow.from_enumerable()
    |> Flow.map(&String.trim_trailing/1)
    |> Flow.flat_map(&(String.split(&1, " ")))
    |> Flow.partition()
    |> Flow.reduce(fn -> %{word: "", length: 0} end, &longest_word/2)
    |> Enum.into(%{})
  end

  def single_threaded_run() do
    load_corpus()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.flat_map(&(String.split(&1, " ")))
    |> Enum.reduce(%{word: "", length: 0}, &longest_word/2)
  end

  def times() do
    {concurrent, _results} = :timer.tc(&concurrent_run/0)
    {single_threaded, _results} = :timer.tc(&single_threaded_run/0)

    IO.puts "Concurrent ran in #{concurrent * 0.001} ms"
    IO.puts "Single Threaded ran in #{single_threaded * 0.001} ms"
  end

  defp load_corpus() do
    "../txt/corpus.txt"
    |> Path.expand(__DIR__)
    |> File.stream!()
  end

  defp longest_word(word, acc) do
    word_length = String.length(word)

    if word_length > acc.length do
      %{word: word, length: word_length}
    else
      acc
    end
  end
end
