namespace :custom do
  desc "Migrate from sqlite to mysql"
  task :migrate => :environment do
    db = SQLite3::Database.new Rails.root.join('db', 'development.sqlite3').to_s
    data = db.execute("SELECT * FROM articles")
    data.each do |row|
      Article.create({
        title: row[1],
        price: row[2]
      })
    end
  end
end
