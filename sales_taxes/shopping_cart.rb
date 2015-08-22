class Shopping_Cart

	attr_reader :shopping_cart

	def initialize
		@shopping_cart = {}
		@total = 0.00
		@total_taxes = 0.00
	end

	def list_contents
		@shopping_cart.each do |item, quantity|
			puts "#{quantity} #{item.name}: #{(item.price * quantity + taxes(item, quantity)).round(2)}"
		end
	end

	def add_item(item, quantity)
		@shopping_cart[item] = quantity
		update_totals(item, quantity)
	end

	def update_totals(item, quantity)
		tax = taxes(item, quantity)
		@total_taxes += tax
		@total += item.price * quantity + tax
	end

	def print_receipt
		list_contents
		puts "Sales Taxes: #{@total_taxes.round(2)}"
		puts "Total: #{@total.round(2)}"
	end

	def taxes(item, quantity)
		taxes_round(item.price * item.tax_rate * quantity).round(2)
	end

	def taxes_round(taxes)
		((taxes * 20).ceil).to_f / 20
	end

end