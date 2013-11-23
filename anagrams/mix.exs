defmodule Anagrams.Mixfile do
  use Mix.Project

  def project do
    [ app: :anagrams,
      version: "0.0.1",
      elixir: "~> 0.11.2-dev",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { Anagrams, [] }]
  end

  defp deps do
    [
      { :cowboy, github: "extend/cowboy" },
      { :dynamo, github: "elixir-lang/dynamo" }
    ]
  end
end
