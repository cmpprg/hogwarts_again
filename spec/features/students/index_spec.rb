require "rails_helper"

RSpec.describe "As a visitor on the students index page", type: :feature do
  it "" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student: harry, professor: snape)
    ProfessorStudent.create(student: harry, professor: hagarid)
    ProfessorStudent.create(student: harry, professor: lupin)
    ProfessorStudent.create(student: malfoy, professor: hagarid)
    ProfessorStudent.create(student: malfoy, professor: lupin)
    ProfessorStudent.create(student: longbottom, professor: snape)

    visit '/students'

    within '.list' do
        expect(page).to have_content("#{harry.name}: #{harry.professors.length}")
        expect(page).to have_content("#{malfoy.name}: #{malfoy.professors.length}")
        expect(page).to have_content("#{longbottom.name}: #{longbottom.professors.length}")
    end

  end
end
