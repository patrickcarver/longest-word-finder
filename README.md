# LongestWordFinder

## Summary

This is a project that demonstrates the usage of Flow, Stream, and Enum modules for finding
the longest word in a text file with 7.5 million lines.

## Setting up text file for input

This project requires a "corpus.txt" downloaded from ... . It is listed in the .gitignore file because the file is too big to store on GitHub.

Create a folder called `txt` at the top level of this project.
Make it your current directory.
Run wget to download text file (see below).

```
mkdir txt
cd txt
wget https://s3.wasabisys.com/correct-horse-battery-staple/trd/corpus.txt
```

## Running benchmarks

At the command line, run `mix run benchmark.exs` to get benchmark of function speeds.
