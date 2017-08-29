/* drop the table if it's already there */
DROP TABLE IF EXISTS todos;

/* create the todo table per specifications */
CREATE TABLE todos (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  details VARCHAR(1000),
  priority INTEGER NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL,
  completed_at TIMESTAMP
);

/* insert 20 new todos */
INSERT INTO todos (title, details, priority, created_at, completed_at)
VALUES
('todo1', 'Study Node', 1, date('2017-8-1'), NULL),
('todo2', 'Study Node', 2, date('2017-8-2'), NULL),
('todo3', 'Study Node', 3, date('2017-8-3'), date('2017-8-3')),
('todo4', 'Study Node', 4, date('2017-8-4'), NULL),
('todo5', 'Study Node', 5, date('2017-8-5'), NULL),
('todo6', 'Study Node', 1, date('2017-8-6'), NULL),
('todo7', 'Study Node', 2, date('2017-8-7'), NULL),
('todo8', 'Study Node', 3, date('2017-8-8'), NULL),
('todo9', 'Study Node', 4, date('2017-8-9'), date('2017-8-9')),
('todo10', 'Study Node', 5, date('2017-8-10'), NULL),
('todo11', 'Study Node', 1, date('2017-8-11'), NULL),
('todo12', 'Study Node', 2, date('2017-8-12'), NULL),
('todo13', 'Study Node', 3, date('2017-8-13'), NULL),
('todo14', 'Study Node', 4, date('2017-8-14'), date('2017-8-14')),
('todo15', 'Study Node', 5, date('2017-8-15'), NULL),
('todo16', 'Study Node', 1, date('2017-8-16'), NULL),
('todo17', 'Study Node', 2, date('2017-8-17'), NULL),
('todo18', 'Study Node', 3, date('2017-8-18'), date('2017-8-18')),
('todo19', 'Study Node', 4, date('2017-8-19'), NULL),
('todo20', 'Study Node', 5, date('2017-8-20'), NULL);


/* Write a SELECT statement to find all incomplete todos with priority 3. */
SELECT title from todos where priority = 3 AND completed_at IS NULL;

/* Write a SELECT statement to find the number of incomplete todos by priority. */
SELECT priority, count(id) from todos where completed_at IS NULL group by priority;

/* Write a SELECT statement to find the number of todos by priority created in the last 30 days. */
SELECT count(id), priority from todos where created_at > (CURRENT_DATE + INTERVAL '-30 day') group by priority;

/* Write a SELECT statement to find the next todo you should work on. This is the */
/* todo with the highest priority that was created first. */
SELECT priority, title, details, created_at from todos order by priority, created_at LIMIT 1;
