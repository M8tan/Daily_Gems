module Quoter_Module
    require 'httparty'
    require 'json'
    if defined?(Ocra)
        require 'httparty'
        require 'json'
    end
    def self.Show_Menu()
        puts("1. Get quote\n2. Save previous quote\n3. Display this menu\n4. Get the saved quotes\n5. Exit")
    end
    def self.Show_Menu_Start()
        puts("  1. Get quote\n  2. Save previous quote\n  3. Display this menu\n  4. Get the saved quotes\n  5. Exit")
    end
    def self.Get_Quote()
        begin
            api_response = HTTParty.get("https://zenquotes.io/api/random")
            formmated = JSON.parse(api_response.body)
            return formmated[0]["q"], formmated[0]["a"]
        rescue => e 
            return "Error: #{e.message}"
        end
    end
    def self.Storage_File_Exists()
        begin
            storage_file = File.open("Quoter_Storage.txt", "r")
            return true
        rescue
            return false
        end
    end
    def self.Create_Storage_File()
        begin
        storage_file = File.new("Quoter_Storage.txt", "w+")
        storage_file.close()
        rescue error => e
            puts("#{e.message}")
        end
    end
    def self.Save_Quote(quote_2_save, quote_author)
        begin
            storage_file = File.open("Quoter_Storage.txt", "a")
            storage_file.write("#{quote_author}: #{quote_2_save}\n")
            storage_file.close()
        rescue error => e 
            puts("Error: #{e.message}")
        end
    end
    def self.Read_Storage_File()
        storage_file = File.open("Quoter_Storage.txt", "r")
        storage_file_content = storage_file.read()
        storage_file.close()
        return storage_file_content
    end

end  