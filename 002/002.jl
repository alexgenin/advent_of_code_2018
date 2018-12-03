# 
# Advent of Code: day 2
# 


# Set wd 
cd("/home/alex/info/advent_of_code/002/")

# Install DataFrames package
using Pkg
# Pkg.add("DataFrames")
# Pkg.add("CSV")
# Pkg.add("StatsBase")
using DataFrames 
using CSV
using StatsBase

# Read input data 
dat = CSV.read("./input.dat", header = 0)
dat_vec = dat[1]


# First part
# ----------


# Counts of twos and threes
twos = 0
threes = 0

for i = 1:length(dat_vec) 
  # Dict of occurrence of each symbol
  print(dat_vec[i], "\n")
  d = countmap(collect(dat_vec[i])) |> 
        collect
  has_twos = count(x -> (x[2] == 2), d) > 0
  has_threes = count(x -> (x[2] == 3), d) > 0
  global twos += has_twos ? 1 : 0
  global threes += has_threes ? 1 : 0
end

print("Checksum: ", twos * threes, "\n")



# Second part 
# -----------

# We want strings that differ of one char at the same position, this is 
# equal to a Levenshtein distance of 0,0,1 (ins/del/sub) = 1
# Pkg.add("StringDistances")
# Pkg.add("Distances")
using StringDistances
using Distances

# Search for the two strings with the minimum Levenshtein distance
mindist = 100
for i = 1:length(dat_vec) 
  for j = 1:length(dat_vec) 
    dist = evaluate(Levenshtein(), dat_vec[i], dat_vec[j])
    if dist <= mindist && i != j
      global mini = i
      global minj = j
      global mindist = dist
    end
  end
end

print("The two closest strings by Levenshtein distance: \n", 
      dat_vec[mini], "\n", dat_vec[minj], "\n", 
      "Now remove the letter that they do not have in common")



