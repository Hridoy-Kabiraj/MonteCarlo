using Random
using LinearAlgebra

# Function to generate a random point in the square [-1, 1) × [-1, 1)
function random_in_square()
    return 2 .* rand(2) .- 1  # Generates a 2D point in [-1, 1) × [-1, 1)
end

# Check if a point lies inside the unit circle 
function is_in_circle(x)
    return dot(x, x) < 1
end

# Simulate the number of hits inside the circle in N trials
function simulate_number_of_hits(N)
    number_hits = 0
    for _ in 1:N
        position = random_in_square()
        if is_in_circle(position)
            number_hits += 1
        end
    end 
    return number_hits
end 

# Run the simulation 
trials = 40000
hits = simulate_number_of_hits(trials)
println("$(hits) hits, estimate of π = ", 4 * hits / trials)

# build an array with the outcome of 10 repetitions
[simulate_number_of_hits(trials) for _ in 1:10]

