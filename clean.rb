# clean.rb
# - remove
#  - turbolinks
#  - coffeescript
#  - jbuilder
#  - comments & empty lines
# - initialise git repo
# simplify app
run "sed -i '' '/turbolinks/d' Gemfile"
run "sed -i '' '/coffee/d' Gemfile"
run "sed -i '' '/jbuilder/d' Gemfile"
run "sed -i '' '/^$/d' Gemfile"
run "sed -i '' '/#/d' Gemfile"
run "sed -i '' '/turbolinks/d' app/assets/javascripts/application.js"
run "sed -i '' 's/, \"data-turbolinks-track\" => true//g' /app/views/layouts/application.html.erb"

# git
run "cat << EOF >> .gitignore
/.bundle
/db/*.sqlite3
/db/*.sqlite3-journal
/log/*.log
/tmp
database.yml
doc/
*.swp
*~
.project
.idea
.secret
.DS_Store
EOF"

rake "db:create"
rake "db:migrate"
rake "db:test:prepare"

git :init
git add: "."
git commit: %Q{ -m 'initial load' }
