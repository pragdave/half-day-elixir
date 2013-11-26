defmodule Anagrams.Dictionary do

  def load(from_file) when is_binary(from_file) do
    File.stream!(from_file)
    |> Enum.map(&String.strip/1)
    |> load
  end

  def load(from_word_list) when is_list(from_word_list) do
    from_word_list
    |> Enum.map(&{&1, signature(&1)})
    |> Enum.reduce(HashDict.new, &add_word_to_dictionary/2)
  end

  def lookup(dictionary, word) do
    Dict.get(dictionary, signature(word), "No anagrams found")
  end

  def signature(word) do
    word
    |> String.to_char_list!
    |> Enum.sort
    |> String.from_char_list!
  end

  def add_word_to_dictionary({word, signature}, dictionary) do
    entry = Dict.get(dictionary, signature, [])
    Dict.put(dictionary, signature, [ word | entry ])
  end

end
