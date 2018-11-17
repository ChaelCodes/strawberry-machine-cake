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

  describe '#scenarios' do
    before { character.save }
    let!(:scenario1) { character.scenarios.create(name: 'Scenario 1')  }
    let!(:scenario2) { character.scenarios.create(name: 'Scenario 2')  }
    subject { character.scenarios }

    it 'associates scenarios and characters' do
      expect(subject).to include(scenario1)
      expect(subject).to include(scenario2)
      expect(scenario1.characters).to include(character)
    end
  end

  describe '#deactivate' do
    subject { character.deactivate }
    it 'should set state to inactive' do
      subject
      expect(character.state).to eq 'inactive'
    end
  end
end
