require( "pry" )

@adventures = [{"number" => 1, "word" => "yes"}, {"number" => 3, "word" => "no"}, {"number" => 78, "word" => "today"} ]

@visited = [{"number" => 1, "word" => "yes"}, {"number" => 3, "word" => "no"}]

for adventure in @adventures
  if @visited.include?(adventure)
    print adventure
  end
end
