require_relative 'shopping_cart.rb'

class Item

	attr_reader :name, :price, :tax_rate

	def initialize (name, price, *tax_cat)
		@name = name
		@price = price
		@tax_category = tax_cat
		@tax_rate = get_tax_rate
	end

	def get_tax_rate
		tax_rate = 0.10
		if @tax_category.include?("exempt")
			tax_rate -= 0.10
		end
		if @tax_category.include?("import")
			tax_rate += 0.05
		end
		tax_rate
	end

end



# Input 1:
cart = Shopping_Cart.new

# cart.add_item(Item.new("Book", 12.49, "exempt"), 1)
# cart.add_item(Item.new("music CD", 14.99), 1)
# cart.add_item(Item.new("chocolate bar", 0.85, "exempt"), 1)


# Input 2

# cart.add_item(Item.new("imported box of chocolates", 10.00, "import", "exempt"), 1)
# cart.add_item(Item.new("imported bottle of perfume", 47.50, "import"), 1)

# Input 3

cart.add_item(Item.new("imported bottle of perfume", 27.99, "import"), 1)
cart.add_item(Item.new("bottle of perfume", 18.99), 1)
cart.add_item(Item.new("pack of headache pills", 9.75, "exempt"), 1)
cart.add_item(Item.new("imported box of chocolates", 11.25, "import", "exempt"), 1)



cart.print_receipt