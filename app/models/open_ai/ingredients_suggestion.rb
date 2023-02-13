module OpenAi
  class IngredientsSuggestion

    def initialize(type:, cuisine:)
      @type = type
      @cuisine = cuisine
    end

    def ingredients
      text_suggestion.split(",").compact_blank.map(&:strip)
    end

    private

    attr_reader :type, :cuisine

    def text_suggestion
      if OpenAi.enabled?
        TextSuggestion.new(prompt: prompt, max_tokens: 120).text
      else
        "onion, garlic, bell pepper, celery, carrots, potatoes, mushrooms, zucchini, spinach, black beans"
      end
    end

    def prompt
      "Please write a comma separated list of ten ingredients one might have. Please exclude generic things like the word vegetables. Consider a #{type} from the #{cuisine} cuisine."
    end
  end
end
