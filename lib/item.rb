# frozen_string_literal: true

class Item
  class InvalidValueError < StandardError; end
  class InvalidWeightError < StandardError; end

  attr_reader :value, :weight

  def initialize(value, weight)
    validate_attributes(value, weight)
    @value = value
    @weight = weight
  end

  private

  def validate_attributes(value, weight)
    raise InvalidValueError if value.negative?
    raise InvalidWeightError unless weight.positive?
  end
end
