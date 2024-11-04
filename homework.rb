require 'date'

class Student
  attr_accessor :name, :surname, :date_of_birth

  @@students = []

  def initialize(name, surname, date_of_birth)
    @name = name
    @surname = surname
    self.date_of_birth = date_of_birth
   end

  def date_of_birth=(date_of_birth)
    parsed_date = Date.parse(date_of_birth)

    if parsed_date > Date.today || parsed_date == Date.today
      raise ArgumentError, 'date of birth can`t be in the future nor today'
    
    else
      @date_of_birth = parsed_date
    end
  
    end

  def calculate_age
   today = Date.today
    age = today.year - @date_of_birth.year
    age -= 1 if today.month < @date_of_birth.month || (today.month == @date_of_birth.month && today.day < @date_of_birth.day)
    age
   end
   
  def add_student
   if @@students.any? {|s| s.name == name && s.surname == surname && s.date_of_birth == date_of_birth}
    puts "This student already exists."
   else
    @@students << self
      puts "#{name} #{surname} has been added to the list."
    end
   end
  
  def self.students
    @@students
 
  end  

  def remove_student()
    @@students.delete(self)
    puts "Student #{name} #{surname} has been removed"
  end

  def self.get_student_by_age(age)
    target_age = Date.today << (age * 12)
    @@students.select{|student| student.calculate_age == age}

   end

  def self.get_student_by_name(name)
    @@students.select {|student| student.name == name}
   end
  end
s = Student.new('John', 'Doe', '18-09-2006')
s2 = Student.new('Jane', 'Doe', '21-01-2008')

s.add_student
s2.add_student

# a = s.calculate_age()


#  s.remove_student 

age = 18
student_by_age = Student.get_student_by_age(age)

name = 'Jane'
student_by_name = Student.get_student_by_name(name)

Student.students.each do |student|
   puts "#{student.name} #{student.surname}, Date of birth: #{student.date_of_birth}"
 end  


puts "These students are #{age} years old"
student_by_age.each do |student|
   puts "#{student.name} #{student.surname}, Date of birth: #{student.date_of_birth}"
  end


puts "These students name are #{name}"
student_by_name.each do |student|
  puts "#{student.name} #{student.surname}, Date of birth: #{student.date_of_birth}"
 end


  