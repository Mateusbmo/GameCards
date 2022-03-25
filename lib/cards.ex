defmodule Cards do
  @moduledoc """
 Provides methods for creating and handling a deck of cards.
"""

  @doc """
 Returns a list of strings representing a deck of playing cards.
 """

  def create_deck do
   values = ["As", "Dois", "Tres", "Quatro", "Cinco", "Seis", "Sete", "Oito", "Nove", "Dez", "Valete", "Rainha", "Rei"]
   suits = ["Espadas", "Paus", "Coracoes", "Diamantes"]

  for suit <- suits, value <- values do
      "#{value} de #{suit}"
    end
   end



  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Dois de Espadas")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should
  be in the hand.


  ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["As de Espadas"]


  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do

    Cards.create_deck
     |> Cards.shuffle
     |> Cards.deal(hand_size)

  end
end
