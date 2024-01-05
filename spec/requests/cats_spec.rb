require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Egg',
        age: 2,
        enjoys: 'Going on quests',
        image: 'https://unsplash.com/photos/orange-tabby-cat-on-tree-branch-kkL7sCWvki8'
      )
      get '/cats'
      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Merle',
          age: 6,
          enjoys: 'Eating snacks',
          image: 'https://unsplash.com/photos/orange-tabby-cat-on-brown-parquet-floor-LEpfefQf4rU'
        }
      }
      post '/cats', params: cat_params
        expect(response).to have_http_status(200)
        cat = Cat.first
        expect(cat.name).to eq 'Merle'
    end
    it "does not create a new cat without a name" do
      cat_params = {
        cat: {
          name: nil,
          age: 6,
          enjoys: 'Eating snacks',
          image: 'https://unsplash.com/photos/orange-tabby-cat-on-brown-parquet-floor-LEpfefQf4rU'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      cat_error = JSON.parse(response.body)
      expect(cat_error['name']).to include "can't be blank"
    end
    it "does not create a new cat without a age" do
      cat_params = {
        cat: {
          name: 'Merle',
          age: nil,
          enjoys: 'Eating snacks',
          image: 'https://unsplash.com/photos/orange-tabby-cat-on-brown-parquet-floor-LEpfefQf4rU'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      cat_error = JSON.parse(response.body)
      expect(cat_error['age']).to include "can't be blank"
    end
    it "does not create a new cat without enjoys" do
      cat_params = {
        cat: {
          name: 'Merle',
          age: 6,
          enjoys: nil,
          image: 'https://unsplash.com/photos/orange-tabby-cat-on-brown-parquet-floor-LEpfefQf4rU'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      cat_error = JSON.parse(response.body)
      expect(cat_error['enjoys']).to include "can't be blank"
    end
    it "does not create a new cat without an image" do
      cat_params = {
        cat: {
          name: 'Merle',
          age: 6,
          enjoys: 'Eating snacks',
          image: nil
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      cat_error = JSON.parse(response.body)
      expect(cat_error['image']).to include "can't be blank"
    end
  end

end