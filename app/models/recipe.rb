class Recipe
  def self.for(search)
    new(**OpenAi::RecipeSuggestion.new(**search.to_params).recipe)
  end

  attr_reader :title, :ingredients, :steps

  def initialize(title:, ingredients:, steps:)
    @title = title
    @ingredients = ingredients
    @steps = steps.map { RecipeStep.new(_1) }
  end

  def image
    OpenAi::RecipeImageSuggestion.new(self)
  end
end
