# 
# Advent of Code: day 3
# 


# Set wd 
cd("/home/alex/info/advent_of_code/003/")

# Install DataFrames package
using Pkg
# Pkg.add("DataFrames")
# Pkg.add("CSV")
# Pkg.add("StatsBase")
using DataFrames 
using CSV
using StatsBase

# Read input data 
f = open("./input.dat")
dat_vec = readlines(f)

# Build a parser for the claims 
function claimparse(str) 
  numbers = split(str[2:length(str)], r"( @ |,|: |x)")
  return parse.(Int, numbers)
end



# First part
# ----------

# 1000 is the maximum fabric size
fabric = zeros(Int, 1000, 1000)

for i = 1:length(dat_vec) 
  claim = claimparse(dat_vec[i])
  for x = (claim[2]+1):(claim[2]+claim[4])
    for y = (claim[3]+1):(claim[3]+claim[5])
      fabric[x,y] += 1
    end
  end
end

# Number of places where things overlap
count(x -> x > 1, fabric)



# Second part
# -----------

# 1000 is the maximum fabric size. 
fabric = zeros(Int, 1000, 1000)

overlaps = falses(1, length(dat_vec))

for i = 1:length(dat_vec) 
  claim = claimparse(dat_vec[i])
  for x = (claim[2]+1):(claim[2]+claim[4])
    for y = (claim[3]+1):(claim[3]+claim[5])
      if fabric[x,y] > 0
        overlaps[claim[1]] = true
        overlaps[fabric[x,y]] = true
      end
      # We store in the fabric matrix the ID of the claim (an Int)
      fabric[x,y] = claim[1]
    end
  end
end

# Check that there is only one fabric that does not overlap 
count(.!overlaps)

# Get the index (claim ID) of that value
findfirst( .!overlaps) # 1260
