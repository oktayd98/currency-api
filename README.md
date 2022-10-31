# README

For schedule rake tasks, I used [whenever](https://github.com/javan/whenever) gem. This gem uses crontab tool which is belongs only unix systems. That's why you have to use unix system to run the app.

- Start `postgresql` and `redis` services
- Install packages with `bundle install`
- Create and seed database with `rails db:setup`
- Schedule rake task with `whenever --update-crontab`
- Start development server with `rails s` in port 3000

> If you want to run the application on a different port please update frontend `.env` file

> Update .env file with your fixer.io apikey
