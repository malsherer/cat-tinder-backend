cats = [
  {
    name: 'Egg',
    age: 2,
    enjoys: 'going on quests',
    image: 'https://unsplash.com/photos/orange-tabby-cat-on-tree-branch-kkL7sCWvki8'
  },
  {
    name: 'John Kramer',
    age: 10,
    enjoys: 'playing games',
    image: 'https://unsplash.com/photos/close-up-photo-of-tabby-cat-cWOzOnSoh6Q'
  },
  {
    name: 'Grizabella',
    age: 13,
    enjoys: 'remembering the old days',
    image: 'https://unsplash.com/photos/gray-tabby-cat-sitting-on-brown-wooden-surface-OE7H8Zp1mw8'
  }
]

cats.each do |each_cat|
  Cat.create each_cat
  puts "creating cat #{each_cat}"
end