# Object Oriented Programming Assignments

# Exercise 1

class Person
	def initialize(name)
		@name = name
	end

	def greet
		puts "Hi, my name is #{@name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object"
	end
end

instructor_a = Instructor.new("Chris")
instructor_a.greet

student_a = Student.new("Cristina")
student_a.greet

instructor_a.teach
student_a.learn

student_a.teach # This does not work because student_a is a Student object and the Student class does not have the teach method.
