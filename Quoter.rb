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
        Quoter_Module.Create_Storage_File_BU()
    when "6"
        Quoter_Module.Restore_Storage_File()
    when "7"
        puts("The daily gems quoter is currently running in #{Quoter_Module.Get_Working_Directory()}")
    when "8"
        answerinvalid = true
        while (answerinvalid)
            print("R U sure about that? {y/n}: ")
            answer = gets.chomp()
            if(answer == "y" || answer == "Y")
                puts("OK! Trying to delete file...")
                Quoter_Module.Delete_Storage_File_Content()
                answerinvalid = false
            elsif(answer == "n" || answer == "N")
                puts("Fine, not deleting :)")
                answerinvalid = false
            else
                puts("Invalid choice, please try again :)")
            end
        end
    when "9"
        running = false
        puts("OK! have a nice day :)")
        sleep 3
    when "10" # Quick exit easter egg for testing
        running = false
    when "hardelete"
        Quoter_Module.Hard_Delete()
    when "help"
        puts("The directory in which the files run containes your saved quotes and backups.\nThe saved quotes file is called Quoter_Storage.txt, if you create a backup it will be called Quoter_Storage_BU.txt,\nAnd if you delete your saved quotes by choosing 8, a backup file will be created automatically,\nnamed Quoter_Storage_AutoBU.txt.\nWhen restoring the storage, it will check if any backups exist, and if so, it will do it's best to restore it.")
    when "fact"
        puts(Quoter_Module.Get_Fact())
    when "lifehack"
        puts(Quoter_Module.Get_LifeHack())
    when "coinflip"
        puts(Quoter_Module.Coin_Flip())
    else
        puts("Invalid choice :)")
    end
end
    