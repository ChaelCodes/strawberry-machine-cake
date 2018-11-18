describe CharacterHelper do
  let(:character) { build :character }

  describe '#iterate_chara_params' do
    let(:character) { build :character, handle: '@tarable', id: 1 }
    subject { helper.iterate_chara_params(character) }

    it 'returns matching character parameters' do
      expect(subject.dig(:character, :display_name)).to eq '7ara'
      expect(subject.dig(:character, :handle)).to eq '@tarable'
      expect(subject.dig(:character, :color)).to eq nil
    end

    it 'sets prev character id and increments version' do
      expect(subject.dig(:character, :previous_character_id)).to eq 1
      expect(subject.dig(:character, :version)).to eq 2
    end

    context 'character is version 6' do
      let(:character) { build(:character, version: 6) }

      it 'increments the version to 7' do
        expect(subject.dig(:character, :version)).to eq 7
      end
    end
  end
end