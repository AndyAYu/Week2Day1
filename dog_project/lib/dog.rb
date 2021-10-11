class Dog

    attr_reader :name, :breed, :age, :favorite_foods
    attr_writer :age

def initialize(name, breed, age, bark, favorite_foods)

    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods

end

def bark
    if @age > 3
        return @bark.upcase
    else
        return @bark.downcase
    end
end

def favorite_food?(food)
@favorite_foods.include?(food.capitalize)
end

end
