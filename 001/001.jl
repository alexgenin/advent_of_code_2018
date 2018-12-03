# 
# Advent of Code: day 1
# 

# Set wd 
cd("/home/alex/info/advent_of_code/001/")

# Install DataFrames package
using Pkg
# Pkg.add("DataFrames")
# Pkg.add("CSV")
using DataFrames 
using CSV
using SparseArrays



# Read input data 
dat = CSV.read("./input.dat", header = 0)
dat_vec = dat[1]

# First answer: it is the last term of the cumulative sum
cumsum(dat_vec)[length(dat_vec)]

# Second answer 
found = false
init = 0;
seen = Dict()
while ! found 
  for i = 1:length(dat_vec) 
    # print(i, "\n")
    global init += dat_vec[i]
    # print(init, "\n")
    if haskey(seen, init) 
      global found = true
      print(foundkey, "\n")
      break
    else 
      global seen[init] = 1
    end
  end
  # print(".")
end

