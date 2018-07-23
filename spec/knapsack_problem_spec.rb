# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'matrix with the subsolutions for the problem intance' do
  it 'raises InvalidWeightError' do
    problem_instance = KnapsackProblem.new(10, items_list)
    expect(problem_instance.subsolutions_matrix).to eq(expected_matrix)
  end
end

RSpec.describe KnapsackProblem do
  let(:item_one) { Item.new(20, 1) }
  let(:item_two) { Item.new(50, 3) }
  let(:item_three) { Item.new(100, 5) }
  let(:item_four) { Item.new(70, 3) }
  let(:item_five) { Item.new(80, 4) }

  describe '.subsolution_matrix' do
    context 'list of items is empty' do
      let(:items_list) { [] }
      let(:expected_matrix) { [] }
      it_behaves_like 'matrix with the subsolutions for the problem intance'
    end

    context 'items in order' do
      let(:items_list) do
        [item_one, item_two, item_three, item_four, item_five]
      end
      let(:expected_matrix) do
        [
          [0, 20, 20, 20, 20,  20,  20,  20,  20,  20,  20],
          [0, 20, 20, 50, 70,  70,  70,  70,  70,  70,  70],
          [0, 20, 20, 50, 70, 100, 120, 120, 150, 170, 170],
          [0, 20, 20, 70, 90, 100, 120, 140, 170, 190, 190],
          [0, 20, 20, 70, 90, 100, 120, 150, 170, 190, 200]
        ]
      end
      it_behaves_like 'matrix with the subsolutions for the problem intance'
    end

    context 'items in reverse order' do
      let(:items_list) do
        [item_five, item_four, item_three, item_two, item_one]
      end
      let(:expected_matrix) do
        [
          [0,  0,  0,  0, 80,  80,  80,  80,  80,  80,  80],
          [0,  0,  0, 70, 80,  80,  80, 150, 150, 150, 150],
          [0,  0,  0, 70, 80, 100, 100, 150, 170, 180, 180],
          [0,  0,  0, 70, 80, 100, 120, 150, 170, 180, 200],
          [0, 20, 20, 70, 90, 100, 120, 150, 170, 190, 200]
        ]
      end
      it_behaves_like 'matrix with the subsolutions for the problem intance'
    end
  end
end
