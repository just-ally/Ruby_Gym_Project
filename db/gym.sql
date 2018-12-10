DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS gym_classes;
DROP TABLE IF EXISTS workouts;
DROP TABLE IF EXISTS members;

CREATE TABLE workouts
(
  id SERIAL PRIMARY KEY,
  workout_name VARCHAR(255),
  workout_type VARCHAR(255)
);

CREATE TABLE members
(
  id SERIAL PRIMARY KEY,
  member_name VARCHAR(255),
  email VARCHAR(255),
  premium_membership BOOLEAN
);

CREATE TABLE gym_classes
(
  id SERIAL PRIMARY KEY,
  workout_id INT REFERENCES workouts(id) ON DELETE CASCADE,
  start_date VARCHAR(255),
  start_time VARCHAR(255),
  capacity INT,
  peak BOOLEAN
);

CREATE TABLE bookings
(
  id SERIAL PRIMARY KEY,
  member_id INT REFERENCES members(id) ON DELETE CASCADE,
  gym_class_id INT REFERENCES gym_classes(id) ON DELETE CASCADE
);
