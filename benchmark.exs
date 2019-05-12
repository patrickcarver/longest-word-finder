Benchee.run(%{
 "concurrent with anonymous function string splitter" =>
  fn -> LongestWordFinder.Concurrent.with_anonymous_string_splitter() end,
 "concurrent with function reference string splitter" =>
  fn -> LongestWordFinder.Concurrent.with_function_reference_string_splitter() end,
 "single threaded lazy" =>
  fn -> LongestWordFinder.SingleThreaded.lazy() end,
 "single threaded greedy" =>
  fn -> LongestWordFinder.SingleThreaded.greedy() end
})
