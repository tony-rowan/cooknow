module OpenAi
  class TextSuggestion
    def initialize(prompt:, max_tokens:)
      @prompt = prompt
      @max_tokens = max_tokens
    end

    def text
      raw_response["choices"].first["text"]
    end

    private

    attr_reader :prompt, :max_tokens

    def response
      client.completions(
        parameters: {
          model: "text-davinci-001",
          prompt: prompt,
          max_tokens: max_tokens
        }
      )
    end

    def client
      OpenAI::Client.new
    end
  end
end
