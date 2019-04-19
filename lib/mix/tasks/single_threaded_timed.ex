defmodule Mix.Tasks.SingleThreaded do
  use Mix.Task

  alias LongestWordFinder

  def run(_) do
    IO.puts LongestWordFinder.single_threaded()
  end
end
