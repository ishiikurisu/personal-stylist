require './app/stylist/Stylist.rb'

if __FILE__ == $PROGRAM_NAME
  stylist = Stylist.new './assets'
  final_template = stylist.compile
  File.open('./b/output.html', 'w') do |fp|
    fp.write final_template
  end
end
