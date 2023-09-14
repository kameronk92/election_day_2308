class Candidate
  attr_reader :name, :party

  def initialize(candidate_info)
    @name = candidate_info[:name]
    @party = candidate_info[:party]
  end
end