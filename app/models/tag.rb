# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings
  # validates_format_of :name, with: /\A[a-zA-Zа-яА-Я0-9]{3,}\z/

  def self.counts
    # self.select('name, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id').reverse_order!
    self.select('name, count(taggings.tag_id) as count').joins(:taggings).group('name, taggings.tag_id')
  end
end
