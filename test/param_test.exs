defmodule ParamTest do
  use ExUnit.Case
  import ExUnit.CaptureLog
  require Logger
  doctest Param

  test "greets the world" do
    assert capture_log(fn ->
             m = ParamN.spawn()
             Param.start_link(%{next: m})
             Param.notify("HELLO")
           end) =~ "HELLO"
  end
end
