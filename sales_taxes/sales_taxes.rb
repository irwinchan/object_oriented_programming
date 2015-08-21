class Basic_Item
	attr_accessor :name :price :tax_rate

	def initialize (name, price)
		@name = name
		@price = price
		@tax_rate = calculate_tax_rate
	end

	def calculate_tax_rate
		tax_rate = 0.1
	end

end

class Imported < Basic_Item
end

class exempt < Basic_Item
end
