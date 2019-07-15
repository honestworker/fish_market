# == Schema Information
#
# Table name: meters
#
#  id         :integer          not null, primary key
#  percentage :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Meter < ApplicationRecord
  validates_presence_of :percentage, allow_blank: false
  validates_numericality_of :percentage
  validate :only_one, on: :create
  validates_inclusion_of :percentage, :in => 0..100, message: I18n.t('inclusion_1_100')


  def self.set_to_zero
    Meter.last.update(percentage: rand(0..100))
  end
  private


  def only_one
    if Meter.count >= 1
      errors.add :base, 'There can only be one Meter'
    end
  end
end
