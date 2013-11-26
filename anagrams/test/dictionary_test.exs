#START:signature
defmodule DictionaryTest do
  use ExUnit.Case
  import Anagrams.Dictionary

  test "the signature of 'cat' is 'act'" do
    assert signature("cat") == "act"
  end
#END:signature
#START:add-word
  test "adding a word to a dictionary that doesn't have the signature creates a new entry" do
    dict = HashDict.new [ { "dgo", ["dog"] } ]
    dict = add_word_to_dictionary({"cat", "act"}, dict) 
    assert Dict.has_key?(dict, "dgo")
    assert Dict.has_key?(dict, "act")
    assert Dict.get(dict, "act") == [ "cat" ]
  end
 
  test "adding a word to a dictionary that does have the signature adds to the entry" do
    dict = HashDict.new [ { "act", ["tac"] } ]
    dict = add_word_to_dictionary({"cat", "act"}, dict) 
    assert Dict.has_key?(dict, "act")
    assert Dict.get(dict, "act") == [ "cat", "tac" ]
  end
#END:add-word
  test "Creating from a word list yields expected result" do
    dict = load %w{dog cat act god wombat}
    assert lookup(dict, "dog") == %w{ god dog }
    assert lookup(dict, "god") == %w{ god dog }
    assert lookup(dict, "cat") == %w{ act cat }
    assert lookup(dict, "act") == %w{ act cat }
    assert lookup(dict, "wombat") == %w{ wombat }
    assert lookup(dict, "koala") == "No anagrams found"
  end
#START:signature

end
#END:signature
