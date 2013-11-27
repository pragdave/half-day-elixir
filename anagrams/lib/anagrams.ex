defmodule Anagrams do
  use Application.Behaviour

  def start(_type, _args) do
    Anagrams.Supervisor.start_link
  end

end
