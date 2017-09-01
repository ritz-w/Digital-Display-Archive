class Project < ActiveRecord::Base
  validates :title, presence: true
  has_many :comments

  searchable do
    text :title, :description, :author, :analysis, :collaborators, :questions
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

