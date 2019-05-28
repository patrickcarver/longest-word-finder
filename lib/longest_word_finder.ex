defmodule LongestWordFinder do

  def load_corpus() do
    "../txt/corpus.txt"
    |> Path.expand(__DIR__)
    |> File.stream!()
  end

  def longest_word(word, acc) do
    word_length = String.length(word)

    if word_length > acc.length do
      %{word: word, length: word_length}
    else
      acc
    end
  end

  defmodule SingleThreaded do
    alias LongestWordFinder, as: LWF

    def lazy() do
      LWF.load_corpus()
      |> Stream.map(&String.trim_trailing/1)
      |> Stream.flat_map(&(String.split(&1, " ")))
      |> Enum.reduce(%{word: "", length: 0}, &LWF.longest_word/2)
    end

    def greedy() do
      LWF.load_corpus()
      |> Enum.flat_map(&(&1 |> String.trim_trailing() |> String.split(" ")))
      |> Enum.reduce(%{word: "", length: 0}, &LWF.longest_word/2)
    end
  end

  defmodule Parallel do
    alias LongestWordFinder, as: LWF

    def with_anonymous_string_splitter() do
      run &String.split(&1, " ")
    end

    def with_function_reference_string_splitter() do
      run &String.split/1
    end

    def run(splitter_fun) do
      LWF.load_corpus()
      |> Flow.from_enumerable()
      |> Flow.map(&String.trim_trailing/1)
      |> Flow.flat_map(splitter_fun)
      |> Flow.partition()
      |> Flow.reduce(&acc/0, &LWF.longest_word/2)
      |> Flow.departition(&acc/0, &merge_results/2, &done/1)
      |> Enum.at(0)
    end

    defp merge_results(partition_result, acc) do
      if partition_result.length > acc.length, do: partition_result, else: acc
    end

    defp done(result), do: result

    defp acc(), do: %{word: "", length: 0}
  end
end
