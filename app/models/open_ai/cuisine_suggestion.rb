module OpenAi
  class CuisineSuggestion
    def initialize(type:)
      @type = type
    end

    def cuisines
      text_suggestion.split(",").compact_blank.map(&:strip)
    end

    private

    attr_reader :type

    def text_suggestion
      if OpenAi.enabled?
        TextSuggestion.new(prompt: prompt, max_tokens: 60).text
      else
        "Italian, Mexican, Chinese, Japanese, Indian, Thai, French, American, Greek"
      end
    end

    def prompt
      "Please write a comma separated list of cuisines for a #{type}."
    end
  end
end
