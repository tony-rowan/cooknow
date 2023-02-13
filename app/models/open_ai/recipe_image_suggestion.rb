module OpenAi
  class RecipeImageSuggestion
    def initialize(recipe)
      @recipe = recipe
    end

    def url
      response
    end

    private

    def response
      if OpenAi.enabled?
        ImageSuggestion.new(prompt: recipe[:title], size: 512).url
      else
        "https://oaidalleapiprodscus.blob.core.windows.net/private/org-8s8oJuDhi4LntIT80KbUni4n/user-cgFee77uCFKZIMGyhRumsJBW/img-PskyV6Gd8iekENMls2rzoXyE.png?st=2023-02-13T13%3A58%3A25Z&se=2023-02-13T15%3A58%3A25Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2023-02-13T13%3A18%3A02Z&ske=2023-02-14T13%3A18%3A02Z&sks=b&skv=2021-08-06&sig=BIX%2B966oT7kraaWfVRf5bXkFUiHp9yzZZ7PQlZLcJ3Y%3D"
      end
    end
  end
end
