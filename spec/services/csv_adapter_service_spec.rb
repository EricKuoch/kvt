require 'rails_helper'
require 'csv'

RSpec.describe CsvAdapterService do
  let(:entity) { create(:entity_sync) }

  describe '#fetch_csv' do
    subject { described_class.new(entity).fetch_csv }
    it { is_expected.to be_an_instance_of Enumerator }

    context 'when csv has headers' do 
      subject { described_class.new(entity).fetch_csv.first.headers }
      it { is_expected.to eq ["date", "amount", "transaction_type", "payment_type"] }
    end

    context 'when entity mentioned that csv has no headers' do 
      let(:entity) { create(:entity_sync, headers:false) }
      subject { described_class.new(entity).fetch_csv.first }
      it { expect { subject.headers }.to raise_error(NoMethodError) }
    end
  end

  describe '#transform_csv_data' do
    let(:csv) { described_class.new(entity).fetch_csv } #TODO use fixtures to store csv || build csv during tests, then delete
    subject { described_class.new(entity).transform_csv_data(csv) }
    it { is_expected.to be_a Array }
  end
end
