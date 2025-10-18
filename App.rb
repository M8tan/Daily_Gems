require 'httparty'
require 'json'
if defined?(Ocra)
    require 'httparty'
    require 'json'
end
def Get_Quote()
    begin
        api_response = HTTParty.get("https://zenquotes.io/api/random")
        formmated = JSON.parse(api_response.body)
        return formmated[0]["q"], formmated[0]["a"]
    rescue => e 
        return "Error: #{e.message}"
    end
end
puts("Welcome to our quoter!")
puts("1 to keep going, 2 to exit")
running = true
while(running)
    print("Want to get a quote?: ")
    choice = gets.chomp
    case choice
    when "1"
        quote, author = Get_Quote()
        if author != nil
            puts("Quote by #{author}:\n#{quote}")
        else
            puts quote
        end
    when "2"
        running = false
        puts("OK! have a nice day :)")
    else
        puts("Invalid choice :)")
    end
end
    