Benchee.run(%{
 "concurrent with anonymous function string splitter" =>
  fn -> LongestWordFinder.concurrent_with_string_splitter("anonymous function") end,
 "concurrent with function reference string splitter" =>
  fn -> LongestWordFinder.concurrent_with_string_splitter("function reference") end,
 "single threaded lazy" =>
  fn -> LongestWordFinder.single_threaded_lazy() end,
 "single threaded greedy" =>
  fn -> LongestWordFinder.single_threaded_greedy() end
})
