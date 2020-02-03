require 'spec_helper'

describe Runreg::Event do
  describe '#initialize' do
    subject { Runreg::Event.new hash }

    context 'when has contains fields with keys containing \'Date\'' do
      let(:hash) do
        {
          "StartDate" => 'start date',
          "StartTime" => 'start time',
          "EndDate" => 'end date'
        }
      end

      it 'converts them' do
        expect(Runreg::Event).to receive(:convert_datetime).with('start date') { 'converted start date' }
        expect(Runreg::Event).to receive(:convert_datetime).with('end date') { 'converted end date' }
        expect(Runreg::Event).not_to receive(:convert_datetime).with('start time')

        expect(subject.StartDate).to eq('converted start date')
        expect(subject.EndDate).to eq('converted end date')
        expect(subject.StartTime).to eq('start time')
      end
    end
  end


  describe '.convert_datetime' do
    subject { Runreg::Event.convert_datetime "/Date(1592625600000-0400)/" }

    it { is_expected.to eq('2020-06-20T00:00:00-04:00') }
  end
end
