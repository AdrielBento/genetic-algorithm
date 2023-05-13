<h1 style="text-align:center"> 🧬 Genetic Algorithm </h1>

### 🧮 One Max

> The GA is working towards finding a binary string with the maximum sum of ones. The population consists of binary strings where each string is a series of 0s and 1s.

- **Population Initialization**: The code creates 100 random "individuals", each being a list of 1000 bits (0s and 1s).

- **Evaluate**: This function sorts the individuals by how many 1s they contain, with the ones having the most 1s coming first.

- **Selection**: This groups the sorted individuals into pairs.

- **Crossover**: This function takes each pair and combines them into two new individuals by randomly swapping parts of their bit strings.

- **Mutation**: This function (currently commented out) would randomly shuffle the bits of an individual with a 5% chance.

- **Algorithm**: This function is the main loop of the genetic algorithm. It calculates the best individual (one with the most 1s), and if it's not a string of all 1s, it generates a new population using the evaluate, selection, and crossover functions, then repeats the process.

- **Solution**: This is the result of the algorithm - a string of 1,000 bits that contains the maximum possible number of 1s.

So in short, this code uses a genetic algorithm to generate a string of 1,000 bits (0s and 1s) that contains as many 1s as possible. It does this by repeatedly generating new populations of bit strings, selecting the fittest strings (ones with the most 1s), and combining them to make new ones.

_📘 Algorithm taught in the book_: [Algorithm Genetic Algorithms in Elixir: Solve Problems Using Evolution](https://www.amazon.com/Genetic-Algorithms-Elixir-Problems-Evolution/dp/168050794X)

---

### 🗝️ Password Game

> This Genetic Algorithm (GA) is trying to match a specific sequence of colors, represented by a list of numbers in base 2 format.

Here's a breakdown of the code:

1. **Colors and Population Initialization**: The `colors` list represents the colors to be matched. The `input` is the binary representation of these colors. The `population` is a list of 100 random color sequences, where each sequence consists of 5 colors.

2. **Fitness**: The `fitness` function calculates the fitness of a color sequence. It assigns a fitness score of 2 if the color matches both the color and the position in the input, 1 if the color is in the input but not at the correct position, and 0 otherwise. The fitness of a sequence is the sum of the fitness scores of its colors.

3. **Evaluate**: The `evaluate` function sorts the population by their fitness in descending order.

4. **Selection**: The `selection` function pairs up the color sequences for crossover.

5. **Crossover**: The `crossover` function combines each pair of color sequences into two new sequences by swapping their parts after a random crossover point.

6. **Mutation**: The `mutation` function randomly shuffles the colors of a sequence with a 5% chance.

7. **Print**: The `print` function outputs the generation number, the input color sequence, and the current best color sequence.

8. **Algorithm**: The `algorithm` function is the main loop of the GA. It calculates the best color sequence in the current population and if it matches the input sequence, the algorithm stops and returns the best sequence. If not, it generates a new population using the evaluate, selection, crossover, and mutation functions and recursively calls itself with the new population and the incremented generation number.

9. **Solution**: The `solution` is the result of running the GA. It is the color sequence that matches the input sequence.

The code displays the current generation, the input color sequence, and the current best color sequence during each generation, and when the solution is found, it outputs the solution and stops.

_🏛️ An algorithm developed for a project at the **Federal University of Paraná**, specifically within the discipline of **Artificial Intelligence II**._
