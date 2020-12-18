-- Database tables indexes creation script.

use geekbrains;

CREATE INDEX users_first_name_last_name_idx ON users (first_name, last_name);

CREATE INDEX profiles_country_city_idx ON profiles (country, city);

CREATE INDEX courses_cost_idx ON courses (cost);