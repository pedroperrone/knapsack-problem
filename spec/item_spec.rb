# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'an Item initialization with invalid weight' do |weight|
  it 'raises InvalidWeightError' do
    expect { Item.new(1, weight) }.to raise_error(Item::InvalidWeightError)
  end
end

RSpec.describe Item do
  describe '.new' do
    context 'valid attributes' do
      it 'initializes an item' do
        item = Item.new(2, 3)
        expect(item.value).to eq(2)
        expect(item.weight).to eq(3)
      end
    end

    context 'invalid attributes' do
      context 'invalid value' do
        it 'raises InvalidValueError' do
          expect { Item.new(-1, 2) }.to raise_error(Item::InvalidValueError)
        end
      end

      context 'invalid weight' do
        context 'weight is zero' do
          it_behaves_like 'an Item initialization with invalid weight', 0
        end

        context 'weight is negative' do
          it_behaves_like 'an Item initialization with invalid weight', -1
        end
      end
    end
  end

  describe 'fit_in?' do
    let(:item) do
      described_class.new(10, 5)
    end

    context 'item weight is smaller than the container capacity' do
      it { expect(item.fit_in?(6)).to be_truthy }
    end

    context 'item weight is equal to the container capacity' do
      it { expect(item.fit_in?(5)).to be_truthy }
    end

    context 'item weight is bigger than the container capacity' do
      it { expect(item.fit_in?(4)).to be_falsey }
    end
  end
end
