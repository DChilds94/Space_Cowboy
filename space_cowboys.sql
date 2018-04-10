DROP TABLE bounty;

CREATE TABLE bounty(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  favourite_weapon VARCHAR(255),
  last_known_location VARCHAR(255),
  bounty_value INT
  );
 
