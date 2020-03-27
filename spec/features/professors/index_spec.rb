require "rails_helper"

RSpec.describe "As a visitor on the professor index page", type: :feature do
  it "I can see a list of all professors including name, age, and specialty" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit '/professors'

    within '.list' do
      within "#professor-#{snape.id}" do
        expect(page).to have_contentj("Name: #{snape.name}")
        expect(page).to have_contentj("Age: #{snape.age}")
        expect(page).to have_contentj("Specialty: #{snape.specialty}")
      end
      within "#professor-#{hagarid.id}" do
        expect(page).to have_contentj("Name: #{hagarid.name}")
        expect(page).to have_contentj("Age: #{hagarid.age}")
        expect(page).to have_contentj("Specialty: #{hagarid.specialty}")
      end
      within "#professor-#{lupin.id}" do
        expect(page).to have_contentj("Name: #{lupin.name}")
        expect(page).to have_contentj("Age: #{lupin.age}")
        expect(page).to have_contentj("Specialty: #{lupin.specialty}")
      end
    end
  end
end
