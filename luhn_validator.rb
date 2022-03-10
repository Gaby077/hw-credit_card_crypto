# frozen_string_literal: true

# Module Luhn Validator
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    sum = 0
    nums_a = number.to_s.chars.map(&:to_i).reverse
    check_digit = nums_a.shift
    nums_a.each_with_index do |value, index|
      value = index.even? ? (value * 2) : (value * 1)
      value = ((value / 10) + (value % 10)) if value >= 10
      sum += value
    end
    (((10 - sum % 10) % 10) == check_digit)
    # TODO: use the integers in nums_a to validate its last check digit
  end
end
