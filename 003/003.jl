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
# Pkg.add("Plots")
using DataFrames 
using CSV
using StatsBase
using Plots
using StatPlots

# Read input data 
f = open("./input.dat")
dat_vec = readlines(f)


# First part
# ----------


# Build a parser for the claims 
function claimparse(str) 
  numbers = split(str[2:length(str)], r"( @ |,|: |x)")
  return parse.(Int, numbers)
end

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

# 1000 is the maximum fabric size
fabric = zeros(Int, 1000, 1000)

for i = 1:length(dat_vec) 
  claim = claimparse(dat_vec[i])
  for x = (claim[2]+1):(claim[2]+claim[4])
    for y = (claim[3]+1):(claim[3]+claim[5])
      fabric[x,y] = claim[1]
    end
  end
end

# Number of places where things overlap
areas = collect(countmap(vec(fabric)))
areas = hcat(map(x -> x[1], areas), 
             map(x -> x[2], areas))




