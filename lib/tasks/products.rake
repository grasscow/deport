desc "генерация 100 продуктов"
 namespace :products do
    task :create=>:environment do
      100.times do |i|
        p=Product.new(name: "Товар #{i+1}", price: rand(1.0e6)/100.0+1, weight: rand(3000)+1 )
        p.description = "t results in an infinite loop and throws a 'Callstack exceeded Max limit' error. ... then the code inside OnSave calls itself each time you save the record."
        p.save!
      end
  end
end
