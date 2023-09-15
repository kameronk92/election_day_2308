require "./spec/spec_helper"

RSpec.describe "Race" do
  before(:each) do 
    @race = Race.new("Texas Governor")
  end
  describe "#initialize" do
    it "exists" do
      expect(@race).to be_an_instance_of(Race)
    end

    it "has candidates" do
      expect(@race.office).to eq("Texas Governor")
      expect(@race.candidates).to eq([])
    end
  end

  describe "#register_candidate!" do
    it "adds an instance of Candidate to the $candidates array" do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      expect(candidate1).to be_an_instance_of(Candidate)
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
      expect(@race.candidates).to include(candidate1)
      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
      expect(@race.candidates.length).to eq(2)
    end
  end
end
