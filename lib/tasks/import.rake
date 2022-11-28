require "csv"

namespace :import do
  desc "Import News Articles Demo Data"
  task news_articles: :environment do
    directory = "data"
    csv_file = "news_articles.csv"

    begin 
      csv = injest_file(directory, csv_file)
    rescue Errno::ENOENT
      next puts "File Read Error: Check file and try again."
    end

    csv.each do |row|
      puts "#{row['title']} - Adding article record to database ..."
      article = parse_article_rows(row)

      puts "#{article[:title]} - Updating like_counts_per_date for article ..."
      converted = convert_dates_helper(row['like_counts_per_date'])

      converted.each do |c_date|
        date = article.likes.find_or_create_by! date: c_date[:date]
        date.increase_count(c_date[:count])
      end

      puts
    end
  end

  def injest_file(directory, filename)
    csv_file = File.read(Rails.root.join(directory, filename), encoding: "ISO-8859-1").encode
    CSV.parse(csv_file, :headers => true)
  end

  def parse_article_rows(data)
    data["slug"] = data["title"].parameterize
    data["excerpt"] = set_article_excerpt(data["title"])

    Article.find_or_create_by! data.to_hash.except!('like_counts_per_date')
  end

  def set_article_excerpt(title)
    begin
      file_path = "#{title.gsub(/[%.:']/, '').gsub(/[^\w]/, '_')}.html"
      file = File.read(Rails.root.join("data", file_path), encoding: "ISO-8859-1").encode
    rescue Errno::ENOENT
      debugger
    end

    Truncato.truncate(file, max_length: 200)
  end

  def convert_dates_helper(data)
    dates = data.split('|').map do |date| 
      date, count = date.split(':')
      Hash date: date, count: count.to_i
    end
  end
end

