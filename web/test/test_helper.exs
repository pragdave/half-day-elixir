Dynamo.under_test(Web.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Web.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
