require 'spec_helper'

describe Spectacle::DSL do

  subject { described_class } #.new()

  describe '#dsl methods' do
    it 'generates documentation' do
      expect(subject.generate).to be_truthy
    end
  end

end
