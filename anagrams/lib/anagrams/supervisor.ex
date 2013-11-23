defmodule Anagrams.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(Anagrams.Server, [ "/usr/share/dict/words" ])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
