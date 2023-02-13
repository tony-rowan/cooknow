class Search
  include ActiveModel::Model
  attr_accessor :type, :cuisine, :ingredients

  def next_unanswered_question
    if type && cuisine && ingredients
      return nil
    end

    if type && cuisine
      return SearchQuestion.for(category: :ingredients, type: type, cuisine: cuisine)
    end

    if type
      return SearchQuestion.for(category: :cuisine, type: type)
    end

    SearchQuestion.for(category: :type)
  end

  def ingredients=(new_ingredients)
    @ingredients = new_ingredients&.compact_blank
  end

  def to_params
    { type:, cuisine:, ingredients: }.compact
  end
end
