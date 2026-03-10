require 'spec_helper'

describe Spectacle::DSL do

  subject { described_class }

  describe '#build_command' do
    it 'builds the correct default command' do
      expected = "npx spectacle build #{Spectacle::Config.spec_file} -o #{Spectacle::Config.output_dir} --quiet"
      expect(subject.send(:build_command)).to eq(expected)
    end

    it 'includes --embed flag when embeddable' do
      Spectacle::Config.embeddable = true
      expect(subject.send(:build_command)).to include('--embed')
    end

    it 'includes --single-file flag' do
      Spectacle::Config.single_file = true
      expect(subject.send(:build_command)).to include('--single-file')
    end

    it 'includes --logo flag' do
      Spectacle::Config.logo = '/path/to/logo.png'
      expect(subject.send(:build_command)).to include('--logo /path/to/logo.png')
    end
  end

  describe '.validate' do
    it 'runs the validate command' do
      expect(subject).to receive(:system).with("npx spectacle validate #{Spectacle::Config.spec_file}")
      subject.validate
    end
  end
end
