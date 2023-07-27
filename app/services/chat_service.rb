class ChatService
  def conn
    Faraday.new(url: "https://api.openai.com/v1/completions") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.headers['Authorization'] = "Bearer #{ENV['OPENAI_API_KEY']}"
    end
  end

  def get_tools(project)
    payload = {
      "model": "text-davinci-003",
      "prompt": project,
      "max_tokens": 200,
      "temperature": 0.5
    }

    response = JSON.parse(
      conn.post do |request|
        request.body = payload.to_json
      end.body, symbolize_names: true
    )
    
    # require 'pry'; binding.pry
    JSON.parse(response[:choices][0][:text])
  end
end