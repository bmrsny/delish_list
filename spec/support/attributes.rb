def recipe_attributes(overrides={})
	{
		title: "Egg Salad",
		description: "Yummy eggs and salad", 
		category: "Lunch", 
		subcategory: "High in protein",
		url: "http://theeggers.com", 
		instructions: "Mix in some eggs and salad. Wa la. Eggs."
	}.merge(overrides)
end

def user_attributes(overrides={})
	
end

def ingredients_attributes(overrides={})
	{
		name: "Egg",
		quantity: 2,
		unit: "oz"
	}.merge(overrides)
end
