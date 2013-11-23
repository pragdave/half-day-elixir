defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:params])
  end


  get "/" do
   render conn, "index.html"
  end

  get "/:word" do
    word = conn.params[:word]
    anagram_list(conn, word, Anagrams.Server.lookup(word))
  end 

  def anagram_list(conn, _, msg) when is_binary(msg) do
    conn.resp_body(msg)
  end

  def anagram_list(conn, word, list) do
    conn
    .assign(:word, word)
    .assign(:anagrams, list)
    |> render"anagrams.html"
  end

end
