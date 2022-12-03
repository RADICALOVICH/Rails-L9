# frozen_string_literal: true

class SequenceResult
  include ActiveModel::Model
  include ActiveModel::Validations
  include SequenceHelper

  attr_accessor :number, :string_array

  validates_presence_of :number, :string_array
  validates :number, format: { with: /\d/, message: 'должно быть числом'}
  validates :string_array, format: { without: /[^\d^\s^]/, message: 'ошибка при вводе строки' }

  def show
    array = string_array.split.map(&:to_i)
    squares(array)
  end
end
