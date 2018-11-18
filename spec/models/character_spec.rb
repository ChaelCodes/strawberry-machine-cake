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

  describe '#deactivate_previous_character' do
    subject { character.deactivate_previous_character }

    context 'without previous character' do
      it { expect { subject }.not_to raise_error }
    end

    context 'with previous character' do
      let(:previous_character) { create(:character) }
      let(:character) { build(:character, previous_character: previous_character) }

      it 'deactivates prior character upon create' do
        expect(previous_character).to receive(:deactivate).and_call_original
        subject
        expect(previous_character.reload.state).to eq('inactive')
      end
    end
  end

  describe '#name_and_version' do
    subject { character.name_and_version }

    it { is_expected.to eq '7ara' }

    context 'named and versioned character' do
      let(:character) { build :character, version: 2 }

      it { is_expected.to eq '7ara 2' }
    end
  end
end
