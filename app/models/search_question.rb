class SearchQuestion
  attr_reader :category, :question, :answers

  def self.for(category:)
    case category
    when :type
      new(
        category: :type,
        question: "What do you want to make?",
        answers: OpenAi::MealTypeSuggestion.new.meal_types
      )
    when :cuisine
      new(
        category: :cuisine,
        question: "Which cuisine do you want to try?",
        answers: OpenAi::CuisineSuggestion.new.cuisines
      )
    when :ingredients
      new(
        category: :ingredients,
        question: "What ingredients do you have available?",
        answers: OpenAi::IngredientsSuggestion.new.ingredients
      )
    else
      nil
    end
  end

  def initialize(category:, question:, answers:)
    @category = category
    @question = question
    @answers = answers
  end
end
