describe Pipeline::Transformer do
  around(:each) do |example|
    isolate_constants do
      example.run
    end
  end

  let(:simple_transformer) do
    unless defined? SimpleTransformer
      class SimpleTransformer
        include Pipeline::Transformer
      end
    end
    SimpleTransformer
  end

  describe 'module inclusion' do
    it 'registers the class as a transformer' do
      expect(Pipeline).to receive(:register_transformer) do |klass|
        expect(klass).to eq(simple_transformer)
      end

      simple_transformer
    end
  end
end
