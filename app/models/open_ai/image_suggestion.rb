module OpenAi
  class ImageSuggestion
    def initialize(prompt:, size: 512)
      @prompt = prompt
      @size = "#{size}x#{size}"
    end

    def url
      response.dig("data", 0, "url")
    end

    private

    attr_reader :prompt, :size

    def response
      client.images.generate(
        parameters: {
          prompt: prompt, size: size
        }
      )
    end

    def client
      OpenAI::Client.new
    end
  end
end
