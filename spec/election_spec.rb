require "./spec/spec_helper"

RSpec.describe "election" do
  before(:each)do
    @election = Election.new
    @tx_gov = Race.new("Texas Governor")
  end
  describe "initialize" do
    it "exists" do
      expect(@election).to be_an_instance_of(Election)
    end
  end

  describe "year" do
    it "reports current year" do
      expect(@election.year).to eq(Time.now.year)
    end
  end

  describe "add race" do
    it "creates a new instance of Race class and stores in an array" do
      @election.add_race(@tx_gov)
      expect(@election.races[0]).to be_an_instance_of(Race)
      expect(@election.add_race("king of everything")).to be_an_instance_of Array
      expect(@election.races.length).to be 2
    end
  end

  describe "add candidate" do
    it "can add a candidate to a race it holds" do
      @tx_gov = Race.new("Texas Governor")
      @election.add_race(@tx_gov)
      candidate1 = @tx_gov.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @tx_gov.register_candidate!({name: "Roberto R", party: :republican})
    end
  end

  describe "vote counts" do
    it "makes a hash of candidates and their votes" do
      @tx_gov = Race.new("Texas Governor")
      @election.add_race(@tx_gov)
      candidate1 = @tx_gov.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @tx_gov.register_candidate!({name: "Roberto R", party: :republican})
      candidate1.vote_for!
      candidate1.vote_for!
      candidate1.vote_for!
      candidate2.vote_for!
      candidate2.vote_for!
      candidate2.vote_for!
      candidate2.vote_for!
      expect(@election.vote_counts).to be_an_instance_of Hash
      expect(@election.vote_counts["Diana D"]).to eq 3
    end
  end
end