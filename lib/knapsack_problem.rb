# frozen_string_literal: true

class KnapsackProblem
  def initialize(knapsack_capacity, items_list)
    @capacity = knapsack_capacity
    @items = items_list
  end

  def subsolutions_matrix
    @subsolutions_matrix ||= solve
  end

  def best_value
    subsolutions_matrix.last.last
  end

  private

  def solve
    return [[0]] if @items.count.zero?
    return [one_item_solution] if single_item?
    solve_with_multiple_items
  end

  def single_item?
    @items.count == 1
  end

  def one_item_solution
    item = @items.first
    (0..@capacity).map do |partial_capacity|
      next 0 unless item.fit_in?(partial_capacity)
      item.value
    end
  end

  def solve_with_multiple_items
    subsolutions_matrix_without_last_item = KnapsackProblem.new(
      @capacity, items_list_without_last
    ).subsolutions_matrix

    full_solution(subsolutions_matrix_without_last_item)
  end

  def items_list_without_last
    @items[0..-2]
  end

  def full_solution(subsolutions)
    subsolutions.push(solution_for_last_item(subsolutions))
  end

  def solution_for_last_item(subsolutions)
    (0..@capacity).map do |partial_capacity|
      if last_item.fit_in?(partial_capacity)
        [
          best_value_without_current_item(subsolutions, partial_capacity),
          best_value_with_current_item(subsolutions, partial_capacity)
        ].max
      else
        subsolutions.last[partial_capacity]
      end
    end
  end

  def best_value_without_current_item(subsolutions, partial_capacity)
    subsolutions.last[partial_capacity]
  end

  def best_value_with_current_item(subsolutions, partial_capacity)
    last_item.value + best_value_with_available_capacity(subsolutions,
                                                         partial_capacity)
  end

  def best_value_with_available_capacity(subsolutions, partial_capacity)
    subsolutions.last[partial_capacity - last_item.weight]
  end

  def last_item
    @items.last
  end
end
