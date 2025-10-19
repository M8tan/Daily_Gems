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
def Storage_File_Exists()
    begin
        storage_file = File.open("Quoter_Storage.txt", "r")
        return true
    rescue
        return false
    end
end
def Create_Storage_File()
    begin
       storage_file = File.new("Quoter_Storage.txt", "w+")
       storage_file.close()
    rescue error => e
        puts("#{e.message}")
    end
end
def Save_Quote(quote_2_save, quote_author)
    begin
        storage_file = File.open("Quoter_Storage.txt", "a")
        storage_file.write("#{quote_author}: #{quote_2_save}\n")
        storage_file.close()
    rescue error => e 
        puts("Error: #{e.message}")
    end
end
def Read_Storage_File()
    storage_file = File.open("Quoter_Storage.txt", "r")
    storage_file_content = storage_file.read()
    storage_file.close()
    return storage_file_content
end
if(!Storage_File_Exists())
    Create_Storage_File()
end

puts("##########")
puts("Welcome to our quoter!")
puts("1 to keep going, 2 to save previous quote, 3 to show this menu, 4 to get the saved quotes, 5 to exit")
puts("##########")
puts("")
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
        Save_Quote(quote, author)
    when "3"
        puts("1 to keep going, 2 to save previous quote, 3 to show this menu, 4 to exit")
    when "4"
        if(Read_Storage_File() == "")
            puts("No saved quotes yet :)")
        else 
            puts(Read_Storage_File())
        end
    when "5"
        running = false
        puts("OK! have a nice day :)")
        sleep 3
    when "10" # Quick exit easter egg for testing
        running = false
    else
        puts("Invalid choice :)")
    end
end
    