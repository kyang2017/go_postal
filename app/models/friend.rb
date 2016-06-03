class Friend < ActiveRecord::Base

  has_many :comments

  #  - name: must be present
  validates :name, :presence => true, :uniqueness => { :scope => :month}, :uniqueness => { :scope => :day}
  validates :month, :presence => true, numericality: { only_integer: true, less_than_or_equal_to: 12, greater_than_or_equal_to: 1 }
  validates :day, :presence => true, numericality: { only_integer: true, less_than_or_equal_to: 31, greater_than_or_equal_to: 1 }

  def status_this_year
    recent_status = Status.where(:friend_id => self.id).order("created_at desc").first
    if recent_status == nil
      return false
    elsif recent_status.created_at.strftime("%Y").to_i == Time.now.strftime("%Y").to_i
      return true
    else
      return false
    end
  end
end
