defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    deck = [1,2,3]
  assert Cards.contains?(deck,3) == true
  end
end
