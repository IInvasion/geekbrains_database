# Goal of project.

It is a GeekBrains MySQL relatinal database basics study project. Database using in the project serves for contain courses data and users who are studying at GeekBrains. To make analysys about user experience and business income to improve study process.

## How to set an environment

To set an environment you should perform scripts in order:
* create_tables.sql
* proc_drop_foreign_keys.sql
* filldb.sql
* beatify_data.sql
* create_foreign_keys.sql
* trig_comments_validation.sql
* func_target_id_is_row_exists.sql
* create_indexes.sql
* create_views.sql

## About.

* samples.sql contains some query samples.
* geekbrains_erdiagram.png contains erdiagram for the project.
* create_tables.sql creates tables structure.
* proc_drop_foreign_keys.sql creates procedure for DROP FOREIGN KEYS IF EXISTS.
* filldb.sql contains some database test data.
* beatify_data.sql beautifies database test data.
* create_foreign_keys.sql creates foreign keys for tables columns.
* trig_comments_validation.sql and func_target_id_is_row_exists.sql trigger and functions use for rating validation during addition data to database process.
* create_indexes.sql creates indexes for queries optimization.
* create_view.sql creates most usable views for database.