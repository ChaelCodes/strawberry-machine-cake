describe Character do
  let(:character) { build :character }

  describe '#new' do
    subject { character }

    it { is_expected.to be_valid }
    it 'stores attributes' do
      expect(subject.display_name).to eq '7ara'
    end
  end

  describe '#pixes' do
    subject { character.pixes }

    it 'returns nothing' do
      is_expected.to be_empty
    end
  end

  describe '#deactivate' do
  end
end
