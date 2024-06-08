use blog;

-- Первые 2 поста

INSERT INTO post (title, subtitle, content, author, author_url, publish_date, image_url, featured, button, button_text) 
values
('The Road Ahead', 
'The road ahead might be paved - it might not be.', 
'content', 
'Mat Vogels', 
'http://localhost:8080/static/images/MatVogels.svg', 
'September 25, 2015', 
'http://localhost:8080/static/images/NothernLights.svg', 
1, 
0, 
''
),
('From Top Down', 
'Once a year, go someplace you’ve never been before.', 
'content', 
'William Wong', 
'http://localhost:8080/static/images/WilliamWong.svg', 
'September 25, 2015', 
'http://localhost:8080/static/images/Lanterns.svg', 
1, 
0, 
''), -- Вторые 6 постов
('Still Standing Tall', 
'Life begins at the end of your comfort zone.', 
'content', 
'Mat Vogels', 
'http://localhost:8080/static/images/WilliamWong.svg', 
'9/25/2015', 
'http://localhost:8080/static/images/Balloons.svg', 
0, 
0, 
''),
('Sunny Side Up', 
'No place is ever as bad as they tell you it’s going to be.', 
'content', 
'Mat Vogels', 
'http://localhost:8080/static/images/MatVogels.svg', 
'9/25/2015', 
'http://localhost:8080/static/images/Bridge.svg', 
0, 
0, 
''),
('Water Falls', 
'We travel not to escape life, but for life not to escape us.', 
'content', 
'Mat Vogels', 
'http://localhost:8080/static/images/MatVogels.svg', 
'9/25/2015', 
'http://localhost:8080/static/images/Sunset.svg', 
0, 
0, 
''),
('Through the Mist', 
'Travel makes you see what a tiny place you occupy in the world.', 
'content', 
'William Wong', 
'http://localhost:8080/static/images/WilliamWong.svg', 
'9/25/2015', 
'http://localhost:8080/static/images/Ocean.svg', 
0, 
0, 
''),
('Awaken Early', 
'Not all those who wander are lost.', 
'content', 
'Mat Vogels', 
'http://localhost:8080/static/images/MatVogels.svg', 
'9/25/2015', 
'http://localhost:8080/static/images/Haze.svg', 
0, 
0, 
''),
('Try it Always', 
'The world is a book, and those who do not travel read only one page', 
'content', 
'Mat Vogels', 
'http://localhost:8080/static/images/MatVogels.svg', 
'9/25/2015', 
'http://localhost:8080/static/images/Waterfall.svg',
0, 
0, 
'');