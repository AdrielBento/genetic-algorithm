# COR   | DECIMAL |
#FF0000 | 2       | [1, 0]
#0000ff | 4       | [1, 0, 0]
#008000 | 6       | [1, 0, 0]
#ffff00 | 8       | [1, 0, 0, 0]
#993399 | 10      | [1, 0, 1, 0]
#ffa500 | 12      | [1, 1, 0, 0]
#ffcbdb | 14      | [1, 1, 1, 0]
#964b00 | 16      | [1, 0, 0, 0, 0]

colors = [16, 2, 8, 14, 10]
input = Enum.map(colors, &Integer.digits(&1, 2))
generation = 1

population =
  for _ <- 1..100 do
    options = Enum.take(Enum.shuffle([2, 4, 6, 8, 10, 12, 14, 16]), 5)
    for x <- options, do: Integer.digits(x, 2)
  end

fitness = fn attempt ->
  Enum.with_index(attempt, fn attempt_color, index ->
    case Enum.at(input, index) == attempt_color do
      true ->
        2

      false ->
        if Enum.member?(input, attempt_color), do: 1, else: 0
    end
  end)
  |> Enum.sum()
end

evaluate = fn population ->
  Enum.sort_by(population, fn x -> fitness.(x) end, &>=/2)
end

selection = fn population ->
  population
  |> Enum.chunk_every(2)
  |> Enum.map(&List.to_tuple(&1))
end

crossover = fn population ->
  Enum.reduce(population, [], fn {dad, mom}, acc ->
    cx_point = :rand.uniform(5)
    {{h1, t1}, {h2, t2}} = {Enum.split(dad, cx_point), Enum.split(mom, cx_point)}
    [h1 ++ t2, h2 ++ t1 | acc]
  end)
end

mutation = fn population ->
  population
  |> Enum.map(fn chromosome ->
    if :rand.uniform() < 0.05 do
      Enum.shuffle(chromosome)
    else
      chromosome
    end
  end)
end

print = fn best, generation ->
  text =
    best
    |> Enum.map(fn x ->
      Integer.undigits(x, 2)
    end)
    |> Enum.join(",")

  generation_text = Integer.to_string(generation)

  input_text =
    input
    |> Enum.map(fn x ->
      Integer.undigits(x, 2)
    end)
    |> Enum.join(",")

  IO.write("\r🧬Generation: #{generation_text} | 🎰Game: #{input_text} | 🎲Current Best: #{text}")
end

algorithm = fn population, algorithm, generation ->
  [best | _] = evaluate.(population)
  print.(best, generation)
  generation = generation + 1

  if fitness.(best) == fitness.(input) do
    best
  else
    population
    |> evaluate.()
    |> selection.()
    |> crossover.()
    |> mutation.()
    |> algorithm.(algorithm, generation)
  end
end

IO.puts("🚥 Start \n")
solution = algorithm.(population, algorithm, generation)
IO.write("\n\n🦠 Solution: ")
IO.inspect(solution)
IO.puts("\n🏁 Finish")
