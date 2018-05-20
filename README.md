"# BACKEND-RECRUITMENT-DELIVERY" 


1- run sql script in the root script.sql to build the database with sample data

2- edit the web.config to fill: (used to share feature)
    <add key="gmailaddress" value="*****@gmail.com" />
    <add key="password" value="*****" />
	

3- Service call examples:
	1- health status- http://localhost:48090/health
	2- list all questions- http://localhost:48090/questions?limit=10&offset=0&filter=
	3- retrieve a question- http://localhost:48090/questions?question_id=3
	4- create a new question- http://localhost:48090/questions
		body:
		{
			question:'Favourite pet?',
			image_url:'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)',
			thumb_url:'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)',
			published_at:'2018-05-17T00:00:00',
			Choices:[{"choice":"dog","votes":11},{"choice":"cat","votes":12},{"choice":"fish","votes":13}]
		}
	5- update a question- http://localhost:48090/questions
		body: 
		{
			id:8,
			question:'Favourite programming language C3?',
			image_url:'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)',
			thumb_url:'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)',
			published_at:'2018-05-17T00:00:00',
			Choices:[{"choice":"C2","votes":11},{"choice":"Python2","votes":12},{"choice":"Objective-C2","votes":13}]
		}
	 
	6- share- http://localhost:48090/share?destinationemail=davidccgomes@gmail.com&content_url=www.google.com	

