# frozen_string_literal: true

# SequenceController
class SequenceController < ApplicationController
  include SequenceHelper

  def show
    @result = SequenceResult.new(sequence_params)
    return unless @result.valid?

    @result_array = @result.show
  end

  private

  def sequence_params
    params.permit(:number, :string_array)
  end
end
