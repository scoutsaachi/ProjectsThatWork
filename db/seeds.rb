# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{category_name: "Climate Change"}, {category_name: "Ecosystems"}, {category_name: "Legal Systems"}, {category_name: "Prisons"},
	{category_name: "Government"}, {category_name: "Theater"}, {category_name: "Archaeology"}, {category_name: "Code for Non-Profits"}, 
	{category_name: "Pollution"}, {category_name: "Acid Rain"}, {category_name: "National Parks"}, {category_name: "Rainforests"}])

p = Project.create(project_name: "Understanding Coal Plants", course_subject: "Environmental Science", 
	description: "Visit coal plants and suggest optimizations to reduce greenhouse gasses from coal", expected_difficulty: "College",
	duration: 10, status: 1)
p.categories<< Category.find_by_category_name("Climate Change")
p.categories << Category.find_by_category_name("Pollution")

p = Project.create(project_name: "COP21: Understanding International Climate Treaties", course_subject: "Political Science", 
	description: "Discuss the negotiations and results of the Paris COP21", expected_difficulty: "High School",
	duration: 20, status: 1)
p.categories<< Category.find_by_category_name("Climate Change")
p.categories << Category.find_by_category_name("Legal Systems")

pi = ProjectInstance.create(project_id: p.id, school: "The Harker School", town: "San Jose", course: "AP Government", 
	grade_level: 10, number_of_students: 20, start_date: "2015-01-29", end_date: "2015-02-19", 
	materials_and_costs: "Posters, Computers", learning_goals: "-Learn how international treaties are negotiated \n -Discuss climate treaties since the Kyoto Protocol",
	community_participation: false, community_partners: "", steps: "Simulate the international treaty, with each student playing a different country at COP21",
	preparation: "Have students research their respective countries and their positions on climate change", reflection_activities: "Write a paper on the success of the simulated negotiation", status: 1)

TeacherReview.create(review_text: "This project worked well, and was effective for students to learn about international treaties",
	rating: 5, feasibility: 3, learning_effectiveness: 4, project_id: p.id, project_instance_id: pi.id)

StudentReview.create(review_text: "I really learned a lot during this project and had fun portraying the country of Norway", 
	rating: 4, feasibility: 5, learning_score: 3, participate_in_future_projects: 4, participants: "Alone", planning_score: 4, 
	project_id: p.id, project_instance_id: pi.id)

User.create([{email:"sahil_manu7@yahoo.com", password:"123456789", password_confirmation:"123456789"}])
Admin.create([{email:"sahil_manu7@yahoo.com", password:"123456789", password_confirmation:"123456789"}])
