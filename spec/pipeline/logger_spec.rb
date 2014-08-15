describe Pipeline::Logging do
  let(:dummy_object) do
    class DummyObject
      include Pipeline::Logging
    end
  end

  describe '#logger' do
    context 'with the default logger' do
      subject { Pipeline::Logging.logger }

      it { is_expected.to be_instance_of(Logger) }
    end

    context 'with a custom logger' do
      let(:dummy_logger) { double("Dummy logger", warn: true, info: true) }
      after { Pipeline::Logging.setup_logger }

      it "users the custom logger" do
        Pipeline::Logging.logger = dummy_logger
        expect(Pipeline::Logging.logger).to eq(dummy_logger)
      end
    end
  end
end
