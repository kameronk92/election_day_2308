require './lib/candidate'

describe Candidate do
  it 'exists' do
    candidate({name: "Diana D", party: :democrat}) = Candidate.new
    expect(candidate).to be_an_instance_of(Candidate)
  end

  it 'has attributes' do
    candidate({name: "Diana D", party: :democrat}) = Candidate.new
  end
end