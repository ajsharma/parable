# Load all our thor files from the commands folder
Dir['./app/commands/**/*.rb'].sort.each do |file|
  Thor::Util.load_thorfile(file)
end
