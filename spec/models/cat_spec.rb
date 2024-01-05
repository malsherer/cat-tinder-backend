require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do
    cat = Cat.create(age: 2, enjoys: 'Naps, naps, and more naps', image: 'https://unsplash.com/photos/white-kitten-Tn8DLxwuDMA')
    expect(cat.errors[:name]).to_not be_empty
  end
  it "should validate age" do
    cat = Cat.create(name: 'Ethel', enjoys: 'Naps, naps, and more naps', image: 'https://unsplash.com/photos/white-kitten-Tn8DLxwuDMA')
    expect(cat.errors[:age]).to_not be_empty
  end
  it "should validate enjoys" do
    cat = Cat.create(name: 'Ethel', age: 2, image: 'https://unsplash.com/photos/white-kitten-Tn8DLxwuDMA')
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  it "should validate image" do
    cat = Cat.create(name: 'Ethel', age: 2, enjoys: 'Naps, naps, and more naps')
    expect(cat.errors[:image]).to_not be_empty
  end
end


