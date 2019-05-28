# LongestWordFinder

## Summary

This is a project that demonstrates the usage of Flow, Stream, and Enum modules for finding
the longest word in a text file with 7.5 million lines.

## Setting up text file for input

This project requires a "corpus.txt" downloaded from ... . It is listed in the .gitignore file because the file is too big to store on GitHub.

Create a folder called `txt` at the top level of this project.
Make it your current directory.
Run wget to download text file (see below).

```bash
mkdir txt
cd txt
wget https://s3.wasabisys.com/correct-horse-battery-staple/trd/corpus.txt
```

## Running benchmarks

At the command line, run `mix run benchmark.exs` to get benchmark of function speeds.

## Benchmark results on my machine:

```bash
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 28 s

Benchmarking parallel with anonymous function string splitter...
Benchmarking parallel with function reference string splitter...
Benchmarking single threaded greedy...
Benchmarking single threaded lazy...

Name                                                       ips        average  deviation         median         99th %
parallel with anonymous function string splitter        0.0468       0.36 min     ±0.00%       0.36 min       0.36 min
parallel with function reference string splitter        0.0263       0.63 min     ±0.00%       0.63 min       0.63 min
single threaded lazy                                    0.0116       1.43 min     ±0.00%       1.43 min       1.43 min
single threaded greedy                                 0.00972       1.71 min     ±0.00%       1.71 min       1.71 min

Comparison: 
parallel with anonymous function string splitter        0.0468
parallel with function reference string splitter        0.0263 - 1.78x slower +0.28 min
single threaded lazy                                    0.0116 - 4.03x slower +1.08 min
single threaded greedy                                 0.00972 - 4.82x slower +1.36 min
```
