class Election
  attr_reader :year, :races, :tallies

  def initialize
    @year = Time.now.year
    @races = []
    @tallies
  end

  def add_race(race)
    @races << race
  end

  def candidates
    all_candidates = []
    @races.each do |race|
      all_candidates << race.candidates
    end
    all_candidates.flatten
  end

  def vote_counts
    tallies = {}
    @races.each do |race|
      race.candidates.each do |candidate|
        tallies[candidate.name] = candidate.votes
      end
    end
    @tallies = tallies
  end
end
