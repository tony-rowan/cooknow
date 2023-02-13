class SearchQuestion
  attr_reader :category, :question, :answers

  def self.for(category:, type: nil, cuisine: nil)
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
        answers: OpenAi::CuisineSuggestion.new(type:).cuisines
      )
    when :ingredients
      new(
        category: :ingredients,
        question: "What ingredients do you have available?",
        answers: OpenAi::IngredientsSuggestion.new(type:, cuisine:).ingredients
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

  def select_multiple?
    category == :ingredients
  end
end
