class Project < ApplicationRecord
    validates :title, presence: true
    has_many :orders
    has_many :comments

  def self.search(search_term)
    @projects = Project.search(search_term)
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.last
  end

  def average_rating
  comments.average(:rating).to_f
end

  def views
    $redis.get("project:#{id}") # this is equivalent to 'GET project:1'
  end

  def viewed!
    $redis.incr("project:#{id}") # this is equivalent to 'INC project:1'
  end
end
