defmodule Asserts do
  defmacro assert(expression) do
    handle_assert(expression)
  end

  def handle_assert({:==, _, [ left, right ]}) do
    left_text = Macro.to_string(left)
    right_text = Macro.to_string(right)
    quote do
      unless unquote(left) == unquote(right) do
        IO.puts """
        Expected #{unquote(left_text)} (#{unquote(left)}) to equal #{unquote(right_text)} (#{unquote(right)})
        """
      end
    end
  end
end

defmodule CodeUnderTest do
  import Asserts

  assert 1 == 2+3
end

nil
