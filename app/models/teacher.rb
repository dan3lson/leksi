class Teacher < User
  has_many :classrooms, dependent: :destroy
  has_many :students, through: :classrooms, dependent: :destroy
  has_many :meaning_alts, dependent: :destroy
  has_many :example_non_examples, dependent: :destroy
  has_many :sent_stems, dependent: :destroy
  has_many :describe_mes, dependent: :destroy

  # TODO Create test
  def has_classroom?(classroom)
    !classrooms.where(name: classroom.name).empty?
  end

  # TODO Create test
  def has_classrooms?
    !Classroom.where(teacher: self).empty?
  end

  # TODO Create test
  def has_classroom_activity?
    has_classrooms? ? students.any? { |s| s.has_recent_activity? } : false
  end
end
