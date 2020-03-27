require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe 'instance methods' do
    it "#average_student_age" do
      hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      ProfessorStudent.create(student: harry, professor: hagarid)
      ProfessorStudent.create(student: malfoy, professor: hagarid)

      expect(hagarid.average_student_age).to eql(11.5)
    end

  end
end
