-- Movie.objects.all()
SELECT * FROM movies_movie;

-- User.objects.all()
SELECT * FROM movies_user;

-- Movie.objects.all().order_by('year')
SELECT * FROM movies_movie
ORDER BY year DESC;

-- User.objects.filter(age=30)
SELECT * FROM movies_user
WHERE age=30;

-- User.objects.filter(age__lt=20)
SELECT * FROM movies_user
WHERE age<20;

-- User.objects.filter(age__gte=20, age__lt=30)
SELECT * FROM movies_user
WHERE age>=20 AND age<30;

-- Movie.objects.filter(Q(year__lt=2000)| Q(year__gt=2010))
SELECT * FROM movies_movie
WHERE year < 2000 OR year > 2010;

-- Movie.objects.aggregate(Max('year'))
SELECT title, MAX(year) FROM movies_movie;

-- User.objects.aggregate(Avg('age'))
SELECT AVG(age) FROM movies_user;

-- 1번 영화의 평균 평점과 최고 평점(Score.objects.filter(movie_id=1).aggregate(Max('value'), Avg('value')))
SELECT MAX(value), AVG(value) FROM movies_score
WHERE movie_id=1;

-- Score.objects.filter(user_id=1).count()
SELECT COUNT(*) FROM movies_score
WHERE user_id=1;

-- Movie.objects.filter(title__contains='the')
SELECT * FROM movies_movie
WHERE title LIKE '%the%';

-- Movie.objects.filter(title__startswith='the')
SELECT * FROM movies_movie
WHERE title LIKE 'the%';

-- Movie.objects.filter(title__endswith='on.')
SELECT * FROM movies_movie
WHERE title LIKE '%on.';

-- ORM에서 사용하려면 정규표현식을 사용해야 함.
SELECT * FROM movies_movie
WHERE title LIKE '%g__d%';

-- User.objects.values('country').distinct()
SELECT COUNT(DISTINCT country) FROM movies_user;

-- User.objects.filter(age__range=[20, 29])
SELECT * FROM movies_user
WHERE age BETWEEN 20 AND 29;

-- Movie.objects.filter(year__in=[2000, 2005, 2010])
SELECT * FROM movies_movie
WHERE year IN(2000, 2005, 2010);