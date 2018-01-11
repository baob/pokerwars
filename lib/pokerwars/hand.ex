defmodule Pokerwars.Hand do
  alias Pokerwars.Score

  def score(cards) do
    cards = Enum.sort(cards)
    calculate_score(cards)

  end

  defp calculate_score(cards) do
    [ top_score | _ ] =
    [
      pair?(cards),
      high_card?(cards)
    ]
    |> Enum.reject(&(&1 == nil))

    top_score
  end

  defp pair?(cards) do
    ranks = extract_ranks(cards)
    case ranks do
      [a, a, k1, k2, k3] -> Score.pair(a, [k1, k2, k3])
      _ -> nil
    end
  end


  defp high_card?(cards) do
    kickers = extract_ranks(cards)
    Score.high_card(kickers)
  end

  defp extract_ranks(cards) do
    Enum.map(cards, fn x -> x.rank end)
  end

end
