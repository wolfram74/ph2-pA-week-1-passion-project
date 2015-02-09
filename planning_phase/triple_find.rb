ab = (1..60).to_a
c2 = ab.map{|c| c**2}
trips = []
ab.each do |a|
  ab.each do |b|
    if c2.include?(a**2+b**2)
      trips << [a, b, (a**2+b**2)**0.5]
    end
  end
end

trips.each{|thr| p thr}