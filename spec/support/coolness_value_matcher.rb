# frozen_string_literal: true

RSpec::Matchers.define :have_coolness_value_of do |expected|
  match do |actual|
    actual == expected
  end
end
