def Read_File()
    storage_file = File.open("Quoter_Storage.txt", "r")
    return storage_file.read()

end
puts(Read_File())