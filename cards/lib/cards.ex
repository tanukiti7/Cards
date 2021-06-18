defmodule Cards do

  @moduledoc"""
  トランプカードの分配
  """

  @doc"""
  トランプのデッキリストを生成する。
  ## Example
      iex> Cards.create_deck
      ["Ace_of_Spade", "Ace_of_Clover", "Ace_of_Diamond", "Ace_of_Heart",
      "Two_of_Spade", "Two_of_Clover", "Two_of_Diamond", "Two_of_Heart",
      "Three_of_Spade", "Three_of_Clover", "Three_of_Diamond", "Three_of_Heart",
      "Four_of_Spade", "Four_of_Clover", "Four_of_Diamond", "Four_of_Heart",
      "Five_of_Spade", "Five_of_Clover", "Five_of_Diamond", "Five_of_Heart",
      "Six_of_Spade", "Six_of_Clover", "Six_of_Diamond", "Six_of_Heart",
      "Seven_of_Spade", "Seven_of_Clover", "Seven_of_Diamond", "Seven_of_Heart",
      "Eight_of_Spade", "Eight_of_Clover", "Eight_of_Diamond", "Eight_of_Heart",
      "Nine_of_Spade", "Nine_of_Clover", "Nine_of_Diamond", "Nine_of_Heart",
      "Ten_of_Spade", "Ten_of_Clover", "Ten_of_Diamond", "Ten_of_Heart",
      "Jack_of_Spade", "Jack_of_Clover", "Jack_of_Diamond", "Jack_of_Heart",
      "Queen_of_Spade", "Queen_of_Clover", "Queen_of_Diamond", "Queen_of_Heart",
      "King_of_Spade", "King_of_Clover", "King_of_Diamond", "King_of_Heart"]
  """
  def create_deck do
    numbers = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King"]
    suits = ["Spade","Clover","Diamond","Heart",]
    for num <- numbers, suit <-  suits do
      "#{num}_of_#{suit}"
    end
  end
  @doc"""
  カードをシャッフルする。
  ## Example
      iex> Cards.shuffle([1,2,3,4])
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck,str) do
    Enum.member?(deck,str)
  end

  @doc"""
    divid the deck to get card
  ## Example
      iex> Cards.deal([1,2,3,4,5],2)
      {[1,2],[3,4,5]}
  """
  def deal(deck,deal_size) do
    Enum.split(deck,deal_size)
  end

  @doc"""
  トランプのカードを自分に五枚、相手に五枚配る。
  ## Example
      iex> Cards.main
  """
  def main do
    deck = create_deck()
    deck = shuffle(deck)
    {mydeck, deck} = deal(deck,5)
    {enemydeck, _deck} = deal(deck,5)
    {mydeck,enemydeck}
  end

  def save(deck,filename) do
      binary=:erlang.term_to_binary(deck)
      File.write(filename,binary)
  end

  def load(filename) do
    {status,binary} = File.read(filename)
    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "ファイル名が間違っています"
    end
  end


end
