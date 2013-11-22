defmodule Anagrams.CLI do

  @default_switches [ dict: "/usr/share/dict/words" ]

  def main(argv) do
    argv 
      |> parse_args 
      |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help   ])
    case  parse  do
    { [ help: true ], _,     _  } -> :help
    { switches,       words, [] } -> { add_defaults(switches), words }
    _                             -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage:  anagrams [ --dict /usr/share/dict/words ] word...
    """
    System.halt(0)
  end

  def process({switches, words}) do
    {time, dict } = :timer.tc(Anagrams.Dictionary, :load, [switches[:dict]])
    IO.puts "loading dictionary took #{time/1.0e6}s"
    Enum.each words, &display_anagram(&1, dict)
  end

  def display_anagram(word, dict) do
    IO.puts "#{word}: #{inspect Anagrams.Dictionary.lookup(dict,word)}"
  end

  def add_defaults(switches) do
    Dict.merge(@default_switches, switches)
  end

end