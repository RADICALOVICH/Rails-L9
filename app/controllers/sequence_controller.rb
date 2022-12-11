# frozen_string_literal: true

# SequenceController
class SequenceController < ApplicationController
  include SequenceHelper

  def show
    @ok = true
    @result = SequenceResult.new(sequence_params)
    return unless @result.valid?

    @result_array = @result.show
    @ok = false if @result_array == []
    @max_array = @result_array.max_by(&:length)
  end

  private

  def sequence_params
    params.permit(:number, :string_array)
  end
end
