module OpenAi
  class MealTypeSuggestion

    def meal_types
      text_suggestion.split(",").compact_blank.map(&:strip)
    end

    private

    def text_suggestion
      if OpenAi.enabled?
        TextSuggestion.new(prompt: prompt, max_tokens: 60).text
      else
        "Breakfast, lunch, dinner, brunch, snack"
      end
    end

    def prompt
      "Please write a comma separated list of meal types."
    end
  end
end
