# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{category_name: "Education"}, {category_name: "Environment"}, {category_name: "Peace studies"}, 
	{category_name: "Public Health"}, {category_name: "School Gardens"}, {category_name: "Social service for those in need"}, 
	{category_name: "Sports"}, {category_name: "Sustainable Farming"}, {category_name: "Veterans"}])

Tag.create([{tag_name: "Building Structures", approved: true}, {tag_name: "Bullying", approved: true}, 
	{tag_name: "Climate change", approved: true}, {tag_name: "Coaching", approved: true}, 
	{tag_name: "Collecting/Donating", approved: true}, {tag_name: "Food pantry", approved: true},
	 {tag_name: "Habitat restoration", approved: true}, {tag_name: "Healthy lifestyle", approved: true}, 
	 {tag_name: "Mentoring", approved: true}, {tag_name: "Nutrition", approved: true}, 
	 {tag_name: "Organ donation", approved: true}, {tag_name: "Photography exhibit", approved: true}, 
	 {tag_name: "Planting trees", approved: true}, {tag_name: "Public Service Announcement ", approved: true}, 
	 {tag_name: "Publication", approved: true}, {tag_name: "Raising animals", approved: true}, 
	 {tag_name: "Raising produce", approved: true}, {tag_name: "Ran Fundraiser", approved: true}, 
	 {tag_name: "Reading", approved: true}, {tag_name: "Recycling", approved: true}, 
	 {tag_name: "Rights (human, civil, women’s)", approved: true}, {tag_name: "Safe Driving", approved: true},
	  {tag_name: "Substance abuse", approved: true}, {tag_name: "Sustainability, environment", approved: true}, 
	  {tag_name: "Tutoring", approved: true}, {tag_name: "Video Production", approved: true}, 
	  {tag_name: "Conflict resolution", approved: true}, {tag_name: "War", approved: true}])

p = Project.create(project_name: "Elementary School Tutoring", course_subject: "Language Arts", 
	description: "Students tutored younger elementary school students in reading.",
	expected_difficulty: "Middle School", expected_duration: 10, status: 1)
p.categories << Category.find_by_category_name("Education")

pi = ProjectInstance.create(course: "Language Arts", grade_level: "Middle School", duration: 10,
 project_notes: "Project kicked off during \"Teen Reads Week\" week full of literature themed days.",
 materials_and_costs: "Total Cost: 3045. Breakdown: Transportation: $120; Books: $1,500; Snacks: $250; T-shirt: $400; Materials: $200; Gas and Mileage: $75; Incentives: $400; Decorations: $100",
 learning_goals:"ELACC7RL 1: Cite textual evidence to support analysis as well as inferences drawn from the text.\n
ELACC7RL2: Determine a theme of a text and analyze its development over the course of the text; provide an objective summary of the text. *ELACC7W4: Produce clear and coherent writing in which the development, organization, and style are appropriate to task, purpose, and audience. *ELACC7SL1: Engage in a range of collaborative discussions (one-on-one, in groups, and teacher-led) with diverse partners on grade 7 topics, texts, and issues, building on others’ ideas and expressing their own clearly. re defined in standards 1–3 above.",
 community_participation: true,
 steps: "Teacher and class discussed the type of reading activities that would be exciting for younger students; came up with activities and books for the younger students, and conveyed important ideas.",
 preparation: "Students performed research \n Students read content on the topic \n Teacher presentations \n Class discussion of learning goals \n class discussion of implementation",
 reflection_activities: "Assessed learning outcomes \n Discussed with class",
 status: 1
 )
pi.project_id = p.id
pi.save
pi.tags << Tag.find_by_tag_name("Tutoring")
pi.tags << Tag.find_by_tag_name("Reading")

TeacherReview.create(rating: 4, review_text: "\"They were so moved by what they were doing, they requested to expand the program to first graders as well. Teachers at our feeder school were inspired by the acts of service from the older students. They said they had never seen anything like that done at their school before. They were appreciative of the collaboration. They were so moved by what they were doing, they requested to expand the program to first graders as well.\"", feasibility: 3, learning_effectiveness: 5, project_id: p.id, project_instance_id: pi.id)
StudentReview.create(rating: 5, review_text: "\"This project is a life changing experience for me and the students that I helped. I hope that the students learned from this experience. I think that students will engage more in reading. I really enjoyed helping other kids learning to read because it can help them in the future. Getting kids loving to read means a lot to me.\"", feasibility: 4, learning_score: 4, participate_in_future_projects: 4.5, project_id: p.id, project_instance_id: pi.id)




User.create([{email:"example@gmail.com", password: "projects-that-work", password_confirmation: "projects-that-work"}])

Admin.create([{email:"ctc.projects.that.work@gmail.com", password:"projects-that-work", password_confirmation:"projects-that-work"}])
