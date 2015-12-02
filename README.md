# ProjectsThatWork
###Web Service Learning Project; Code The Change

####Schema:

* **Project**: Represents information for one project. Multiple users can participate in one project
  * *project_name*: Name of Project
  * *difficulty*: General difficulty of project (note, may want this field to update based on reviews)
  * **Projects have many Categories** (many-to-many relationship in CategoriesProducts table)
  * **Projects have many Reviews** (many-to-one)
* **User**: Represents a single logged on user
  * *user_email*: email of user
  * *user_name*: full name of user
  * *user_type*: student, teacher, or organization
  * **Users have many Reviews** (many-to-one)
* **Category**: Represents a general tag for a project. A project can have many such tags
  * *category_name*: name of category
  * **Categories belong to Projects** (many-to-many relationship in CategoriesProducts table)
* **Review**: Represents a superclass of reviews that are made by users for a project. The Review class, (and all subclasses of review) are created using hzamani's gem for multiple table inheritance: (see `https://github.com/hzamani/active_record-acts_as` for how to use these classes)
  * *project_id* project which has this review
  * *user_id* user who made this review
  * *review_text* the text of the review
  * *rating* the rating of the review
  * **Review belongs to a Project** (many-to-one)
  * **Review belongs to User** (many-to-one)
  * **Review has subclasses: TeacherReview, StudentReview, OrganizationReview**
* **StudentReview**: Reviews by students, inherits from Review
  * *school* school at which project was done
* **TeacherReview**: Reviews by teachers, inherits from Review
  * *school* school at which project was done
* **OrganizationReview**: Reviews by Organization
  * *organization_type* type of organization (government, non-profit, company, etc)
