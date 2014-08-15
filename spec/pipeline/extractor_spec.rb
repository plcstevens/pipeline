describe Pipeline::Extractor do
  around(:each) do |example|
    isolate_constants do
      example.run
    end
  end

  let(:simple_extractor) do
    unless defined? SimpleExtractor
      class SimpleExtractor
        include Pipeline::Extractor
      end
    end
    SimpleExtractor
  end

  describe 'module inclusion' do
    it 'registers the class as a extractor' do
      expect(Pipeline).to receive(:register_extractor) do |klass|
        expect(klass).to eq(simple_extractor)
      end

      simple_extractor
    end
  end
end
