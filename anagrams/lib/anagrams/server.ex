defmodule Anagrams.Server do

  use GenServer.Behaviour

  # API
  def start_link(words) do
    :gen_server.start_link({ :global, :anagrams }, __MODULE__, words, [])
  end

  def lookup(word) do
    :gen_server.call {:global, :anagrams}, { :lookup, word }
  end


  # Implementation
  def init(words) do
    { :ok, Anagrams.Dictionary.load(words) }
  end

  def handle_call({:lookup, word}, _from, dictionary) do
    IO.puts "Looking up #{word}"
    { :reply, Anagrams.Dictionary.lookup(dictionary, word), dictionary }
  end
end