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
        Expected #{unquote(left_text)} (#{unquote(left)}) 
        to equal #{unquote(right_text)} (#{unquote(right)})
        """
      end
    end
  end
end

defmodule Example do
  defmacro log(expr) do
    source = Macro.to_string(expr)
    quote do
      IO.puts "#{unquote(source)} = #{unquote(expr)}"
      unquote(expr)
    end
  end
end

defmodule UseExample do
  import Example

  IO.puts "Result = #{log 1 + 2}"

end


defmodule CodeUnderTest do
  import Asserts

  assert 1 == 2+3
end

nil
