describe Pipeline::Loader do
  around(:each) do |example|
    isolate_constants do
      example.run
    end
  end

  let(:simple_loader) do
    unless defined? SimpleLoader
      class SimpleLoader
        include Pipeline::Loader
      end
    end
    SimpleLoader
  end

  describe 'module inclusion' do
    it 'registers the class as a loader' do
      expect(Pipeline).to receive(:register_loader) do |klass|
        expect(klass).to eq(simple_loader)
      end

      simple_loader
    end
  end
end
