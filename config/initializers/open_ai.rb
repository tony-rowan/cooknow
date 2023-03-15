if ENV.fetch("OPEN_AI_ENABLED", false)
  OpenAI.configure do |config|
    config.access_token = ENV.fetch("OPENAI_ACCESS_TOKEN")
  end
end
