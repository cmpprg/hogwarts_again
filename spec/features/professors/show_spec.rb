require "rails_helper"

RSpec.describe "As a visitor on the professor show page", type: :feature do
  it "I can see a list of student names that the professor has" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create(student_id: harry, professor_id: snape)
    ProfessorStudent.create(student_id: longbottom, professor_id: snape)
    ProfessorStudent.create(student_id: malfoy, professor_id: hagarid)

    visit "/professors/#{snape.id}"

    within ".list" do
      expect(page).to have_content(harry.name)
      expect(page).to have_content(longbottom.name)
      expect(page).to have_no_content(malfoy.name)
    end

  end
end
