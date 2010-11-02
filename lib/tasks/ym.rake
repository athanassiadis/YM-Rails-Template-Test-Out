namespace :ym do
  task :init do
    puts 'Installing HTML 5 Boilerplate'
    sh 'compass init rails -r html5-boilerplate -u html5-boilerplate --css-dir public/stylesheets --force'
      puts 'Installing Devise'
    sh 'rails generate devise:install'
    puts 'Generating User model'
    sh 'rails generate devise User'
    puts 'Generating User views'
    sh 'rails generate devise:views users -t=haml'

    
    puts 'Installing acts_as_taggable_on'
    sh 'rails generate acts_as_taggable_on:migration'

    sh 'rails g comment'
    puts 'Generating routes'
    sh 'rake routes'
    puts 'Creating a home controller and view'
    sh 'rails g controller home index'
    puts 'Populating development database'
    sh 'rake db:migrate'
    puts 'Checking in'
    sh 'git add .'
    sh "git commit -a -m 'Finished creating YM application'"
    puts 'Finished creating YM application'
  end
end
