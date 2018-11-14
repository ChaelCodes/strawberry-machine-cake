describe Character do
  describe '#pixes' do
    let(:character) { Character.new }
    subject { character.pixes }

    it 'returns nothing' do
      is_expected.to be_empty
    end
  end
end
