require_relative 'Quoter_Module'
if(!Quoter_Module.Storage_File_Exists())
    Quoter_Module.Create_Storage_File()
end

puts("##############################")
puts("  Welcome to our quoter!")
Quoter_Module.Show_Menu_Start()
puts("##############################")
puts("")
running = true
while(running)
    print("Please choose an option: ")
    choice = gets.chomp
    case choice
    when "1"
        quote, author = Quoter_Module.Get_Quote()
        if author != nil
            puts("Quote by #{author}:\n#{quote}")
        else
            puts quote
        end
    when "2"
        Quoter_Module.Save_Quote(quote, author)
    when "3"
        Quoter_Module.Show_Menu()
    when "4"
        if(Quoter_Module.Read_Storage_File() == "")
            puts("No saved quotes yet :)")
        else 
            puts(Quoter_Module.Read_Storage_File())
        end
    when "5"
        Delete_Storage_File_Content()
    when "9"
        running = false
        puts("OK! have a nice day :)")
        sleep 3
    when "10" # Quick exit easter egg for testing
        running = false
    else
        puts("Invalid choice :)")
    end
end
    