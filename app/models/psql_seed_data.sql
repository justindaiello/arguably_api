CREATE TABLE polls (id SERIAL, question VARCHAR(240), answer1 VARCHAR(50), answer2 VARCHAR(50), bp1 VARCHAR(240), bp2 VARCHAR(240), bp3 VARCHAR(240), bp4 VARCHAR(240), bp5 VARCHAR(240), bp6 VARCHAR(240), image VARCHAR(240), open BOOLEAN, vote1 INT DEFAULT 0, vote2 INT DEFAULT 0);

INSERT INTO polls (question, answer1, answer2, bp1, bp2, bp3, bp4, bp5, bp6, open) VALUES ('Is a hotdog a sandwhich?', 'YES', 'NO', 'Of course it is', 'It is inside bread', 'Yes it is', 'No it is not', 'Are you crazy?', 'Random thing here', true);

INSERT INTO polls (question, answer1, answer2, bp1, bp2, bp3, bp4, bp5, bp6, open) VALUES ('Is mayo a condiment?', 'YES', 'NO', 'Of course it is', 'It is a condiment', 'Yes it is', 'No it is not', 'Are you crazy?', 'Random thing here', true);


INSERT INTO polls (question, answer1, answer2, bp1, bp2, bp3, bp4, bp5, bp6, open) VALUES ('Is mayo a condiment?', 'YES', 'NO', 'Of course it is', 'It is a condiment', 'Yes it is', 'No it is not', 'Are you crazy?', 'Random thing here', false);
