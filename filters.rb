# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates'
require 'date'

def find(id)
    # Your code Here
    @candidates.find { |candidate| candidate[:id] == id }
end
  
def experienced?(candidate)
    # Your code Here
    if candidate[:years_of_experience] >= 2
        return true
    else
        return false
    end
end
  
def qualified_candidates(candidates)
    # Your code Here
    candidates.select do |candidate|
        experienced?(candidate) &&
        candidate[:github_points] >= 100 &&
        (candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')) &&
        (Date.today - candidate[:date_applied]).to_i <= 15 &&
        candidate[:age] > 17
    end
end
  
  # More methods will go below

def ordered_by_qualifications(candidates)
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end