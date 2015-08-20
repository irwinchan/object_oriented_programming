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

