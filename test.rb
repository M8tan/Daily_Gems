require 'fileutils'
def Delete_Storage_File_Content()
    begin 
        FileUtils.cp('ert.txt', 'Quoter_Storage_BU.txt')
    rescue StandardError => e
        puts("Oh damn, #{e.message}")
    end
end
def Storage_File_BU_Exists()
    begin
        storage_file = File.open("Quoter_Storage_BU.txt", "r")
        storage_file.close()
        return true
    rescue
        return false
    end
end
def Storage_File_AutoBU_Exists()
    begin
        storage_file = File.open("Quoter_Storage_AutoBU.txt", "r")
        storage_file.close()
        return true
    rescue
        return false
    end
end
def Storage_File_Any_BU_Exists()
    if(Storage_File_BU_Exists() && Storage_File_AutoBU_Exists())
        return true
    elsif(Storage_File_BU_Exists() || Storage_File_AutoBU_Exists())
        return true
    elsif(Storage_File_AutoBU_Exists() || Storage_File_BU_Exists())
        return true
    else
        return false
    end
end

puts(Storage_File_BU_Exists())
puts(Storage_File_AutoBU_Exists())
puts(Storage_File_Any_BU_Exists())
