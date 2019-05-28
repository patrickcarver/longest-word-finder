Benchee.run(%{
 "parallel with anonymous function string splitter" =>
  fn -> LongestWordFinder.Parallel.with_anonymous_string_splitter() end,
 "parallel with function reference string splitter" =>
  fn -> LongestWordFinder.Parallel.with_function_reference_string_splitter() end,
 "single threaded lazy" =>
  fn -> LongestWordFinder.SingleThreaded.lazy() end,
 "single threaded greedy" =>
  fn -> LongestWordFinder.SingleThreaded.greedy() end
})
