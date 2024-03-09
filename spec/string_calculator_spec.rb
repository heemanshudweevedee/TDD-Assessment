require 'rails_helper'

RSpec.describe StringCalculator do
  describe 'Verify String calculator add method ' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'returns the sum of numbers for comma-separated numbers' do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it 'returns the sum of numbers for comma-separated numbers' do
        expect(StringCalculator.add("1,2,3")).to eq(6)
      end

    it 'supports new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'return invalid' do
        expect(StringCalculator.add("1,\n")).to raise_error(RuntimeError, "Invalid input")
    end

    it 'supports custom delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'throws an exception for single negative number' do
      expect { StringCalculator.add("-1,2") }.to raise_error(RuntimeError, "negative numbers not allowed: -1")
    end

    it 'throws an exception for multiple negative numbers' do
        expect { StringCalculator.add("-1,-2,3") }.to raise_error(RuntimeError, "negative numbers not allowed: -1, -2")
    end

    it 'supports decimal values' do
        expect(StringCalculator.add("1.5,2.5")).to eq(4)
    end

    it 'output should be integer' do
        expect(StringCalculator.add("1.5,2")).to eq(3)
    end

    it 'ignores non-numeric characters' do
        expect(StringCalculator.add("1,a,2,b,3")).to eq(6)
    end

  end
end

