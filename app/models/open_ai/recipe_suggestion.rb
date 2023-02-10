module OpenAi
  class RecipeSuggestion
    attr_reader :type, :cuisine, :ingredients

    def initialize(type:, cuisine:, ingredients:)
      @type = type
      @cuisine = cuisine
      @ingredients = ingredients
    end

    def recipe
      title = nil
      ingredients = []
      steps = []

      looking_for = :title

      text_lines.each do |line|
        case looking_for
        when :title
          title = line
          looking_for = :ingredients
        when :ingredients
          next if line == "Ingredients:"

          if line == "Directions:"
            looking_for = :steps
          else
            ingredients << line
          end
        when :steps
          steps << line
        end
      end

      { title:, ingredients:, steps: }
    end

    private

    def text_lines
      text_suggestion.split("\n").compact_blank
    end

    def text_suggestion
      if OpenAi.enabled?
        TextSuggestion.new(prompt: prompt, max_tokens: 400).text
      else
        "\n\nChinese Egg Rolls\n\nIngredients:\n\n8 eggs\n\n1/2 cup chopped onion\n\n1/2 cup chopped green bell pepper\n\n1/2 cup chopped celery\n\n1/2 teaspoon salt\n\n1/4 teaspoon black pepper\n\n1 tablespoon vegetable oil\n\n1/2 cup all-purpose flour\n\n1 cup chicken broth\n\n1 tablespoon soy sauce\n\n1 teaspoon sugar\n\n1/4 teaspoon ground ginger\n\n1 (16 ounce) package frozen egg roll wrappers\n\nDirections:\n\n1. In a large saucepan, whisk together the eggs, onion, bell pepper, celery, salt, and black pepper. Heat over medium heat, stirring occasionally, until the eggs are firm but not dry. Remove from heat and stir in the vegetable oil.\n\n2. In a small bowl, whisk together the flour, chicken broth, soy sauce, sugar, and ginger. Pour into the saucepan and stir until well combined.\n\n3. Preheat the oven to 400 degrees F (200 degrees C).\n\n4. Working with one wrapper at a time, place about 2 tablespoons of the egg mixture in the center of the wrapper. Wet the edges of the wrapper with water, then fold the wrapper in half over the filling, pressing the edges together to seal. Pinch the edges of the wrapper together to form a tight seal.\n\n5. Place the egg rolls on a baking sheet and bake for 10 minutes, or until golden brown."
      end
    end
  end
end
