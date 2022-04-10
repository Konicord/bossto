defmodule HoctoTest do
  use ExUnit.Case
  doctest Hocto

  test "greets the world" do
    assert Hocto.hello() == :world
  end
end
