 #This file should contain all the record creation needed to seed the database with its defaul_idt author1.id, title: 'Mayor Race'.
 
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  voter1 = User.create!(username: 'Cody')
  voter2 = User.create!(username: 'Mauricio')
  voter3 = User.create!(username: 'Steve')
  author1 = User.create!(username: 'Shakespere')
  author2 = User.create!(username: 'Bob')
  
  Poll.destroy_all
  poll1 = Poll.create!(author_id: author1.id, title: 'Mayor Race')
  poll2 = Poll.create!(author_id: author2.id, title: 'Thanksgiving Survey')
  
  Question.destroy_all
  question1 = Question.create!(poll_id: poll1.id, body: 'Who is your Mayor?')
  question2 = Question.create!(poll_id: poll1.id, body: 'Who has done the most for the city?')
  question3 = Question.create!(poll_id: poll2.id, body: 'Work today?')
  question4 = Question.create!(poll_id: poll2.id, body: 'Macy''s Parade??')
  
  AnswerChoice.destroy_all
  a1 = AnswerChoice.create!(question_id: question1.id, body: 'Deblazio')
  a2 = AnswerChoice.create!(question_id: question1.id, body: 'Bloomberg')
  a3 = AnswerChoice.create!(question_id: question2.id, body: 'Deblazio')
  a4 = AnswerChoice.create!(question_id: question2.id, body: 'Bloomberg')
  a5 = AnswerChoice.create!(question_id: question3.id, body: 'Yes')
  a6 = AnswerChoice.create!(question_id: question3.id, body: 'No')
  a7 = AnswerChoice.create!(question_id: question4.id, body: 'Yes')
  a8 = AnswerChoice.create!(question_id: question4.id, body: 'No')
  
  Response.destroy_all
  r1 = Response.create!(voter_id: voter1.id, answer_choice_id: a1.id)
  r1b = Response.create!(voter_id: voter2.id, answer_choice_id: a2.id)
  r2a = Response.create!(voter_id: voter1.id, answer_choice_id: a2.id)
  r2 = Response.create!(voter_id: voter1.id, answer_choice_id: a4.id)
  r3 = Response.create!(voter_id: voter2.id, answer_choice_id: a5.id)
  r4 = Response.create!(voter_id: voter3.id, answer_choice_id: a8.id)
end
