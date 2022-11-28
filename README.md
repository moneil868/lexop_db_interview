# BE Dev - Technical Test

## Provided Requirements
### Problem
Users are interested in browsing online news covering various topics while being able to filter news articles by category and author, like certain
news articles, and view a bar chart of likes per day for any news article.
### Software Design Specification
Web application solution backend will be built in Ruby on Rails (any version greater than or equal to 6.0) and consist of the following features:

- Web page for listing news articles (displaying for each news article: title, publication date, author, category, total like count, and body excerpt
with no more than 200 characters, ending with “…”).
- Web page for viewing the content of a specific news article (title, publication date, author, category, total like count, and body, rendered as
HTML)
- Filter news articles by category and/or author (ensure that filters can be combined)
- A rake task (rake import:news_articles) to load news articles into the database from /data directory (relative to project root),
containing manually unzipped news_app_data.zip files (e.g. /data/news_articles.csv and corresponding HTML files like /data
/montreal_hawks_minor_league_baseball_team_wins_championship.html ). Assume /data/news_articles.csv is always
well-formed (contains all attribute values and no repeated unique titles) and is always accompanied by all news article HTML files.
- The solution must consist of Rails route(s), Rails controller(s), ERB view(s), ActiveRecord-model(s), ActiveRecord-migration(s), and optionally
extra Ruby classes/modules. You may design software layers and the database any way you deem fit. Rails Scaffolding is acceptable.
news_app_data.zip must be manually unzipped in /data directory relative to the project root, and then afterwards processed with rake
task (rake import:news_articles) to import into the database. It is OK to submit /data directory along with project files.
- The news article model must validate that the title is unique, and that the title, body, author, publication_date, and category are present. Also,
if your model layer includes other models, ensure they have validations that ensure data integrity as well.
- The rake task (rake import:news_articles) must be idempotent.
- All backend code except the rake task must be covered by automated tests (i.e. models and controllers). RSpec, MiniTest, or any other
testing library is acceptable.

### Testing
- Models and Controller tests must be included

### System Requirements
- Ruby version 2.7+
- Rails version 6+

## Operationalize Acceptance Criteria
### User Features
- Users are able to view list of all available articles 
  - Article attributes are displayed in the list
  - Filters are included, which allow filtering bby author and category

- Users are able to navigate to a single article
  - Article attribute data is displayed on page
  - Statistics on article likes are displayed using a bar graph

### Database Seeding
Users must have the ability to add a new or updated csv file to the `/data` directory and import data using a rake task. 
#### Assumptions
Data maintains the following format:

"Montreal Hawks Minor League Baseball Team Wins Championship","2029-10-17","Sports","Aaron Bishop","2029-
10-17:15|2029-10-18:20|2029-10-19:30|2029-10-20:25|2029-10-21:32|2029-10-22:28|2029-10-23:40"

That translates to the following news article meta-data:
- title: "Montreal Hawks Minor League Baseball Team Wins Championship"
- publication_date: "2029-10-17"
- category: "Sports"
- author: "Aaron Bishop"
- like_counts_per_date:
  - 2029-10-17: 15 likes
  - 2029-10-18: 20 likes
  - 2029-10-19: 30 likes
  - 2029-10-20: 25 likes
  - 2029-10-21: 32 likes
  - 2029-10-22: 28 likes
  - 2029-10-23: 40 likes


#### Limitations
- Database is PostgreSQL instead of SQLite
- Users are not able to update article field using data import
- Users are not able to delete articles using the data import.

