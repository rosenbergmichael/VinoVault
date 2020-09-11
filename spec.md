Specifications for the Rails Assessment

Specs:

 [x] Using Ruby on Rails for the project
 [x] Include at least one has_many relationship (User has_many Wines)
 [x] Include at least one belongs_to relationship (Wine belongs_to User)
 [x] Include at least two has_many through relationships (Wine has_many Users through Reviews, User has_many ReviewedWines through Reviews)
 [x] Include at least one many-to-many relationship (Wine has_many Users through Reviews, User has_many ReviewedWines through Reviews)
 [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (reviews.notes)
 [x] Include reasonable validations for simple model objects (list of model objects with validations: User, Wine, Review)
 [x] Include a class level ActiveRecord scope method (scope method alpha calls .order on Wines to list them alphabetiacly e.g. @user.wines.alpha URL: /wines)
 [x] Include signup ('/signup')
 [x] Include login ('/login')
 [x] Include logout (link_to "Sign Out", sessions#destroy)
 [x] Include third party signup/login (link_to "Sign In with Google, '/auth/:provider/callback', sessions#google)
 [x] Include nested resource show or index (/users/5/wines)
 [x] Include nested resource "new" form (/wines/3/reviews/new)
 [x] Include form display of validation errors ('layouts/_errors' partial)

Confirm:

 [x] The application is pretty DRY
 [x] Limited logic in controllers
 [x] Views use helper methods if appropriate
 [x] Views use partials if appropriate