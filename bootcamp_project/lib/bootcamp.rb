class Bootcamp

attr_reader :name, :slogan, :teachers, :students


def initialize(name, slogan, student_capacity)

    @name = name
    @slogan = slogan
    @student_capacity = 6
    @teachers = []
    @students = []
    @grades = Hash.new  { |h,k| h[k] = [] }

end
  
def hire(teacher)
    teachers << teacher
end

def enroll(student)
    if @students.length < @student_capacity
        students << student
        return true
    else
        return false
    end

end

def enrolled?(student)
    @students.include?(student)
end

def student_to_teacher_ratio
    @students.length / @teachers.length
end

def add_grade(student, grade)
    if enrolled?(student)
        @grades[student] << grade
        return true
    else
        return false
    end
end

 def num_grades(student)
    @grades[student].length
 end

def average_grade(student)
    return nil if @grades[student].empty?
    @grades[student].sum / num_grades(student)
end


end
