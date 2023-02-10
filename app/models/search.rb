class Search
  attr_reader :type, :cuisine, :ingredients

  def initialize(type: nil, cuisine: nil, ingredients: nil)
    @type = type
    @cuisine = cuisine
    @ingredients = ingredients
  end

  def next_unanswered_question
    answered_question_types = to_params.compact.keys
    left_to_ask = questions.reject { _1[:category].in?(answered_question_types) }
    left_to_ask.first
  end

  def add_answer(category:, answer:)
    case category.to_sym
    when :type then @type = answer
    when :cuisine then @cuisine = answer
    when :ingredients then @ingredients = Array.wrap(answer)
    end
  end

  def to_params
    { type:, cuisine:, ingredients: }
  end

  private

  def questions
    [
      {
        category: :type,
        question: "What do you want to make?",
        answers: ["Main Meal", "Light Snack", "Dessert"]
      },
      {
        category: :cuisine,
        question: "What cuisine would you like to try?",
        answers: ["Indian", "Chinese", "Italian", "Spanish"]
      },
      {
        category: :ingredients,
        question: "What do you have in your fridge?",
        answers: ["Chicken", "Eggs", "Thyme", "Sugar"]
      }
    ]
  end
end
