require "httparty"
require "json"

    response = HTTParty.get("https://api.viewbits.com/v1/uselessfacts?mode=random")
    puts response["text"]
