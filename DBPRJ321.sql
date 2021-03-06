USE [master]
GO
CREATE DATABASE [FPT_Test]
GO
USE [FPT_Test]
GO
CREATE TABLE [Subject](
	[subjectID] [int] IDENTITY(1,1) NOT NULL primary key,
	[subjectName] [nvarchar](100) NOT NULL)
GO
CREATE TABLE [Class](
	[classID] [int] IDENTITY(1,1) NOT NULL primary key,
	[className] [nvarchar](100) NOT NULL,
	[classContent] [text],
	[subjectID] [int])
GO
ALTER TABLE [Class]
ADD CONSTRAINT fk_class
FOREIGN KEY (subjectID)
REFERENCES  [Subject](subjectID)
ON DELETE CASCADE;
GO
CREATE TABLE [Test](
	[testID] [int] IDENTITY(1,1) NOT NULL primary key,
	[testName] [nvarchar](max) NOT NULL,
	[classID] [int],
	[testContent] [text],
	[difficulty] [int] NOT NULL)
GO
ALTER TABLE [Test]
ADD CONSTRAINT fk_test
FOREIGN KEY (classID)
REFERENCES  [Class](classID)
ON DELETE CASCADE;
GO
CREATE TABLE [Question](
	[questionID] [int] IDENTITY(1,1) NOT NULL primary key,
	[testID] [int] NOT NULL,
	[questionContent] [nvarchar](max) NOT NULL,
	[opt1] [nvarchar](100) NOT NULL,
	[opt2] [nvarchar](100) NOT NULL,
	[opt3] [nvarchar](100) NOT NULL,
	[opt4] [nvarchar](100) NOT NULL,
	[rightOption] [int] NOT NULL)
GO
ALTER TABLE [Question]
ADD CONSTRAINT fk_question
FOREIGN KEY (testID)
REFERENCES  Test(testID)
ON DELETE CASCADE;
GO
CREATE TABLE [User](
	[userID] [int] IDENTITY(1,1) NOT NULL primary key,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[userType] [int] NOT NULL)
GO
CREATE TABLE [Mark](
	[userID] [int] NOT NULL,
	[testID] [int] NOT NULL,
	[mark] [float] NOT NULL)
GO
ALTER TABLE [Mark]
ADD CONSTRAINT fk_mark
FOREIGN KEY (testID)
REFERENCES  Test(testID)
ON DELETE CASCADE;
GO
ALTER TABLE [Mark]
ADD CONSTRAINT fk_mark2
FOREIGN KEY (userID)
REFERENCES  [User](userID)
ON DELETE CASCADE;
GO
CREATE TABLE [UserResponse](
	[responseID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL foreign key references [User](userID),
	[title] [nvarchar](max) NOT NULL,
	[responseContent] [text] NOT NULL)
GO

INSERT [Subject] ([subjectName]) VALUES (N'English')
INSERT [Subject] ([subjectName]) VALUES (N'Java Core')
INSERT [Subject] ([subjectName]) VALUES (N'Working in group')
INSERT [Subject] ([subjectName]) VALUES (N'Advanced Algorithm')
INSERT [Subject] ([subjectName]) VALUES (N'Physics')
GO

INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'PC1234', N'Lop tieng anh Top Fundamental', 1)
INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'PC2345', N'Lop tieng anh Top Notch 1', 1)
INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'PC3456', N'Lop Java co ban cho fresher', 2)
INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'PC4567', N'Lop Java nang cao cho junior', 2)
INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'PC5678', N'Lam viec nhom', 3)
INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'PC6789', N'Lam viec nhom', 3)
INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'PC5678', N'Thuat toan co ban cho lap trinh vien', 4)
INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'PC6789', N'Cac thuat toan nang cao', 4)
INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'PC5678', N'Vat Ly co dien', 5)
INSERT [Class] ([className], [classContent], [subjectID]) VALUES (N'PC6789', N'Vat Ly hien dai va Vat Ly luong tu', 5)
GO

INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 English', 1, N'Bai test 1 lay diem ba tuan dau', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 English', 1, N'Bai test 2, luu y khong dung textbook', 2)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 English', 2, N'Bai test 1 lay diem ba tuan dau', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 English', 2, N'Bai test 2, luu y khong dung textbook', 2)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 Java Core', 3, N'Bai test mot tuan 1,2,3', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 Java Core', 3, N'Bai test hai tuan 4,5,6', 4)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 Java Core', 4, N'Bai test mot tuan 1,2,3', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 Java Core', 4, N'Bai test hai tuan 4,5,6', 4)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 Working in Group', 5, N'Noi dung test tu chuong 1 đen chuong 5', 4)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 Working in Group', 5, N'Noi dung test tu chuong 6 đen chuong 10', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 Working in Group', 6, N'Noi dung test tu chuong 1 đen chuong 5', 4)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 Working in Group', 6, N'Noi dung test tu chuong 6 đen chuong 10', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 Algorithms', 7, N'Kiem tra phan chuong dau', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 Algorithms', 7, N'Kiem tra phan chuong 5,6,7', 2)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 Algorithms', 8, N'Kiem tra phan chuong 1,2,3', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 Algorithms', 8, N'Kiem tra chuong 6,7,8', 2)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 Physics', 9, N'Kiem tra phan co va nhiet', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 Physics', 9, N'Kiem tra phan may tinh luong tu', 2)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 1 Physics', 10, N'Kiem tra phan co va nhiet', 3)
INSERT [Test] ([testName], [classID], [testContent], [difficulty]) VALUES (N'Test 2 Physics', 10, N'Kiem tra phan may tinh luong tu', 2)
GO

INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'I ..... tennis every Sunday morning.', N'playing', N'play', N'	am playing', N'am play', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'Don''t make so much noise. Noriko ..... to study for her ESL test!', N'try', N'tries', N'tried', N'is trying', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'Jun-Sik ..... his teeth before breakfast every morning.', N'will cleaned', N'is cleaning', N'cleans', N'clean', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'Sorry, she can''t come to the phone. She ..... a bath!', N'is having', N'having', N'have', N'has', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'..... many times every winter in Frankfurt.', N'It snows', N'It snowed', N'It is snowing', N'It is snow', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'How many students in your class ..... from Korea?', N'comes', N'come', N'came', N'are coming', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'Weather report: "It''s seven o''clock in Frankfurt and ..... ."', N'there is snow', N'it''s snowing', N'it snows', N'it snowed', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'Babies ..... when they are hungry.', N'cry', N'cries', N'cried', N'are crying', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'Jane: "What ..... in the evenings?"
																											Mary: "Usually I watch TV or read a book."', N'you doing', N'you do', N'do you do', N'are you doing', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'Jane: "What ..... ?"
																											Mary: "I''m trying to fix my calculator."', N'you doing', N'you do', N'do you do', N'are you doing', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'Jane ..... her blue jeans today, but usually she wears a skirt or a dress.', N'wears', N'wearing', N'wear', N'is wearing', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'I think I ..... a new calculator. This one does not work properly any more.', N'needs', N'needed', N'need', N'am needing', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'Sorry, you can''t borrow my pencil. I ..... it myself.', N'was using', N'using', N'use', N'am using', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'At a school dance:
																											Jane: " ..... yourself?"
																											Mary: "Yes, I''m having a great time!"', N'You enjoying', N'Enjoy you', N'Do you enjoy', N'Are you enjoying', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (1, N'I''ve just finished reading a story called Dangerous Game. It''s about a man who ..... his wife because he doesn''t want to lose her.', N'kills', N'killed', N'kill', N'is killing', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'What time .....', N'the train leaves?', N'leaves the train?', N'is the train leaving?', N'does the train leave?', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'Jane: "Are you going to the dance on Friday?"
																											Mary: "No, I''m not. I ..... school dances; they''re loud, hot and crowded!"', N'not enjoy', N'don''t enjoy', N'doesn''t enjoy', N'am not enjoying', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'I ..... for my pen. Have you seen it?', N'will look', N'looking', N'look', N'am looking', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'You can keep my iPod if you like. I ..... it any more.', N'don''t use', N'doesn''t use', N'didn''t use', N'am not using', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'The phone ...... Can you answer it, please?', N'rings', N'ring', N'rang', N'is ringing', 4)

INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'Let us play ...... chess', N'no article', N'a', N'an', N'the', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'She wants to become ...... engineer', N'a', N'an', N'the', N'no article', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'He hopes to join ...... university soon', N'a', N'an', N'the', N'no article', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'...... Oranges are grown in Nagpur', N'a', N'an', N'the', N'no article', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'This is ...... car I bought yesterday', N'no article', N'a', N'an', N'the', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'Are you attending ...... reception today', N'a', N'an', N'the', N'no article', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'...... meat you cooked tasted good', N'a', N'an', N'the', N'no article', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'...... Pandiyan Express is very popular', N'a', N'an', N'the', N'no article', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'India will become ...... super power shortly', N'a', N'an', N'the', N'some', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (2, N'...... lion is a ferocious animal', N'a', N'an', N'the', N'no article', 3)

INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'I ..... tennis every Sunday morning.', N'playing', N'play', N'	am playing', N'am play', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'Don''t make so much noise. Noriko ..... to study for her ESL test!', N'try', N'tries', N'tried', N'is trying', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'Jun-Sik ..... his teeth before breakfast every morning.', N'will cleaned', N'is cleaning', N'cleans', N'clean', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'Sorry, she can''t come to the phone. She ..... a bath!', N'is having', N'having', N'have', N'has', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'..... many times every winter in Frankfurt.', N'It snows', N'It snowed', N'It is snowing', N'It is snow', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'How many students in your class ..... from Korea?', N'comes', N'come', N'came', N'are coming', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'Weather report: "It''s seven o''clock in Frankfurt and ..... ."', N'there is snow', N'it''s snowing', N'it snows', N'it snowed', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'Babies ..... when they are hungry.', N'cry', N'cries', N'cried', N'are crying', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'Jane: "What ..... in the evenings?"
																											Mary: "Usually I watch TV or read a book."', N'you doing', N'you do', N'do you do', N'are you doing', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'Jane: "What ..... ?"
																											Mary: "I''m trying to fix my calculator."', N'you doing', N'you do', N'do you do', N'are you doing', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'Jane ..... her blue jeans today, but usually she wears a skirt or a dress.', N'wears', N'wearing', N'wear', N'is wearing', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'I think I ..... a new calculator. This one does not work properly any more.', N'needs', N'needed', N'need', N'am needing', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'Sorry, you can''t borrow my pencil. I ..... it myself.', N'was using', N'using', N'use', N'am using', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'At a school dance:
																											Jane: " ..... yourself?"
																											Mary: "Yes, I''m having a great time!"', N'You enjoying', N'Enjoy you', N'Do you enjoy', N'Are you enjoying', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (3, N'I''ve just finished reading a story called Dangerous Game. It''s about a man who ..... his wife because he doesn''t want to lose her.', N'kills', N'killed', N'kill', N'is killing', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'What time .....', N'the train leaves?', N'leaves the train?', N'is the train leaving?', N'does the train leave?', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'Jane: "Are you going to the dance on Friday?"
																											Mary: "No, I''m not. I ..... school dances; they''re loud, hot and crowded!"', N'not enjoy', N'don''t enjoy', N'doesn''t enjoy', N'am not enjoying', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'I ..... for my pen. Have you seen it?', N'will look', N'looking', N'look', N'am looking', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'You can keep my iPod if you like. I ..... it any more.', N'don''t use', N'doesn''t use', N'didn''t use', N'am not using', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'The phone ...... Can you answer it, please?', N'rings', N'ring', N'rang', N'is ringing', 4)

INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'Let us play ...... chess', N'no article', N'a', N'an', N'the', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'She wants to become ...... engineer', N'a', N'an', N'the', N'no article', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'He hopes to join ...... university soon', N'a', N'an', N'the', N'no article', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'...... Oranges are grown in Nagpur', N'a', N'an', N'the', N'no article', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'This is ...... car I bought yesterday', N'no article', N'a', N'an', N'the', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'Are you attending ...... reception today', N'a', N'an', N'the', N'no article', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'...... meat you cooked tasted good', N'a', N'an', N'the', N'no article', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'...... Pandiyan Express is very popular', N'a', N'an', N'the', N'no article', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'India will become ...... super power shortly', N'a', N'an', N'the', N'some', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (4, N'...... lion is a ferocious animal', N'a', N'an', N'the', N'no article', 3)
--Java Core
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'Which of the following is not OOPS concept in Java?', N'Inheritance', N'Encapsulation', N'Polymorphism', N'Compilation', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'Which of the following is a type of polymorphism in Java?', N'Compile time polymorphism', N'Execution time polymorphism', N'Multiple polymorphism', N'Multilevel polymorphism', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'When does method overloading is determined?', N'At run time', N'At compile time', N'At coding time', N'At execution time', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'Which statement is true regarding an object?', N'An object is what classes instantiated are from', N'An object is an instance of a class', N'An object is a variable', N'An object is a reference to an attribute', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'Which concept of Java is a way of converting real world objects in terms of class?', N'Polymorphism', N'Encapsulation', N'Abstraction', N'Inheritance', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'Which concept of Java is achieved by combining methods and attribute into a class?', N'Encapsulation', N'Inheritance', N'Polymorphism', N'Abstraction', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'What is it called if an object has its own lifecycle and there is no owner?', N'Aggregation', N'Composition', N'Encapsulation', N'Association', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'What is it called where child object gets killed if parent object is killed?', N'Aggregation', N'Composition', N'Encapsulation', N'Association', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'What is it called where object has its own lifecycle and child object cannot belong to another parent object?', N'Aggregation', N'Composition', N'Encapsulation', N'Association', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'Which of this keyword must be used to inherit a class?', N'super', N'this', N'extent', N'extends', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'A class member declared protected becomes a member of subclass of which type?', N'public member', N'private member', N'protected member', N'static member', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'Which of these is correct way of inheriting class A by class B?', N'class B + class A {}', N'class B inherits class A {}', N'class B extends A {}', N'class B extends A {}', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'Which of the following access specifiers can be used for an interface?', N'Protected', N'Private', N'Public', N'Public, protected, private', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'What type of variable can be defined in an interface?', N'public static', N'private final', N'public final', N'static final', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (5, N'What does an interface contain?', N'Method definition', N'Method declaration', N'Method declaration and definition', N'Method name', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'What type of methods an interface contain by default?', N'abstract', N'static', N'final', N'private', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'What will happen if we provide concrete implementation of method in interface?', N'The concrete class implementing that method need not provide implementation of that method', N'Runtime exception is thrown', N'Compilation failure', N'Method not found exception is thrown', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'What happens when a constructor is defined for an interface?', N'Compilation failure', N'Runtime Exception', N'The interface compiles successfully', N'The implementing class will throw exception', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'What happens when we access the same variable defined in two interfaces implemented by the same class?', N'Compilation failure', N'Runtime Exception', N'The JVM is not able to identify the correct variable', N'The interfaceName.variableName needs to be defined', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'Which of these return type of hasNext() method of an iterator?', N'Integer', N'Double', N'Boolean', N'Collections Object', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'Which of these methods is used to obtain an iterator to the start of collection?', N'start()', N'begin()', N'iteratorSet()', N'iterator()', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'Which of these methods can be used to move to next element in a collection?', N'next()', N'move()', N'shuffle()', N'hasNext()', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'Which of these iterators can be used only with List?', N'Setiterator', N'ListIterator', N'Literator', N'None of the mentioned', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'Which of these is a method of ListIterator used to obtain index of previous element?', N'previous()', N'previousIndex()', N'back()', N'goBack()', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'Which of these exceptions is thrown by remover() method?', N'IOException', N'SystemException', N'ObjectNotFoundExeception', N'IllegalStateException', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'What requires less resources?', N'Thread', N'Process', N'Thread and Process', N'Neither Thread nor Process', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'What decides thread priority?', N'Process', N'Process scheduler', N'Thread', N'Thread scheduler', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'What should not be done to avoid deadlock?', N'Avoid using multiple threads', N'Avoid hold several locks at once', N'Execute foreign code while holding a lock', N'Use interruptible locks', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'Which of these keywords is used to make a class?', N'class', N'struct', N'int', N'none of the mentioned', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (6, N'Which of the following is a valid declaration of an object of class Box?', N'Box obj = new Box();', N'Box obj = new Box;', N'obj = new Box();', N'new Box obj;', 1)

INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Which of the following is not OOPS concept in Java?', N'Inheritance', N'Encapsulation', N'Polymorphism', N'Compilation', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Which of the following is a type of polymorphism in Java?', N'Compile time polymorphism', N'Execution time polymorphism', N'Multiple polymorphism', N'Multilevel polymorphism', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'When does method overloading is determined?', N'At run time', N'At compile time', N'At coding time', N'At execution time', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Which statement is true regarding an object?', N'An object is what classes instantiated are from', N'An object is an instance of a class', N'An object is a variable', N'An object is a reference to an attribute', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Which concept of Java is a way of converting real world objects in terms of class?', N'Polymorphism', N'Encapsulation', N'Abstraction', N'Inheritance', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Which concept of Java is achieved by combining methods and attribute into a class?', N'Encapsulation', N'Inheritance', N'Polymorphism', N'Abstraction', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'What is it called if an object has its own lifecycle and there is no owner?', N'Aggregation', N'Composition', N'Encapsulation', N'Association', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'What is it called where child object gets killed if parent object is killed?', N'Aggregation', N'Composition', N'Encapsulation', N'Association', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'What is it called where object has its own lifecycle and child object cannot belong to another parent object?', N'Aggregation', N'Composition', N'Encapsulation', N'Association', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Which of this keyword must be used to inherit a class?', N'super', N'this', N'extent', N'extends', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'A class member declared protected becomes a member of subclass of which type?', N'public member', N'private member', N'protected member', N'static member', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Which of these is correct way of inheriting class A by class B?', N'class B + class A {}', N'class B inherits class A {}', N'class B extends A {}', N'class B extends A {}', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Which of the following access specifiers can be used for an interface?', N'Protected', N'Private', N'Public', N'Public, protected, private', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'What type of variable can be defined in an interface?', N'public static', N'private final', N'public final', N'static final', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'What does an interface contain?', N'Method definition', N'Method declaration', N'Method declaration and definition', N'Method name', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'What type of methods an interface contain by default?', N'abstract', N'static', N'final', N'private', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'What will happen if we provide concrete implementation of method in interface?', N'The concrete class implementing that method need not provide implementation of that method', N'Runtime exception is thrown', N'Compilation failure', N'Method not found exception is thrown', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'What happens when a constructor is defined for an interface?', N'Compilation failure', N'Runtime Exception', N'The interface compiles successfully', N'The implementing class will throw exception', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'What happens when we access the same variable defined in two interfaces implemented by the same class?', N'Compilation failure', N'Runtime Exception', N'The JVM is not able to identify the correct variable', N'The interfaceName.variableName needs to be defined', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Which of these return type of hasNext() method of an iterator?', N'Integer', N'Double', N'Boolean', N'Collections Object', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Which of these methods is used to obtain an iterator to the start of collection?', N'start()', N'begin()', N'iteratorSet()', N'iterator()', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Which of these methods can be used to move to next element in a collection?', N'next()', N'move()', N'shuffle()', N'hasNext()', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Which of these iterators can be used only with List?', N'Setiterator', N'ListIterator', N'Literator', N'None of the mentioned', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Which of these is a method of ListIterator used to obtain index of previous element?', N'previous()', N'previousIndex()', N'back()', N'goBack()', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Which of these exceptions is thrown by remover() method?', N'IOException', N'SystemException', N'ObjectNotFoundExeception', N'IllegalStateException', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'What requires less resources?', N'Thread', N'Process', N'Thread and Process', N'Neither Thread nor Process', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'What decides thread priority?', N'Process', N'Process scheduler', N'Thread', N'Thread scheduler', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'What should not be done to avoid deadlock?', N'Avoid using multiple threads', N'Avoid hold several locks at once', N'Execute foreign code while holding a lock', N'Use interruptible locks', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Which of these keywords is used to make a class?', N'class', N'struct', N'int', N'none of the mentioned', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Which of the following is a valid declaration of an object of class Box?', N'Box obj = new Box();', N'Box obj = new Box;', N'obj = new Box();', N'new Box obj;', 1)

--Working in group
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Sociologists describe the term ''group'' as ….', N'Collection of people', N'People involved in organized pattern of interaction', N'People interacting at a place', N'Participants in a gathering', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Which one of the following is a ''secondary group''?', N'Nuclear family', N'Peer group', N'Association', N'Joint family', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'The success of group work does NOT depend on?', N'Achievement of goals', N'Understanding and agreement on major problems', N'Handling of behavioural problems', N'Ignoring individual problems', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Leader in a group does NOT depend on?', N'Authoritarian Approach', N'Distribution of responsibility', N'Rapport with individual members', N'Understanding group dynamics', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Who among the following helped group work rooted in social work profession?', N'Kurt Lewin', N'H.B. Trecker', N'Murry G. Ross', N'G. Hamilton', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Responsibility for the choice of programme in group work rest with —————?', N'Members of the group', N'Group worker', N'The Agency', N'Members of the group with the help of group worker', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'The basic objective of group work is  ———?', N'Personality development', N'Problem solving', N'Readjustment', N'Remediation', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Value of the programme in group work lies in?', N'Establishing satisfying affective (love) relationship', N'Enhancing knowledge of possible alternative activities.', N'Giving expression to creative dynamics drives', N'Increasing proficiency in the chosen programme activity', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Programme in social group work is base on ———?', N'Interest and resources', N'Interests and resources of the worker', N'Interests and resources of the group', N'None of the above.', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Social group work as a method of  social work aims at———————?', N'Development of democratic life style', N'Development of leadership qualities', N'Development of capability  of adjustment', N'All the above', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Group morale refers to ——————————?', N'Cooperation in a group', N'Coordination in a group', N'Unity in a group', N'Team spirit in a group.', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Which of the following is NOT a principle of social group work? ', N'Confidentiality', N'Guided group interactions', N'Progressive programme development', N'Evaluation of the progress made by the group', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Who was an early pioneer in the settlement house movement in London?', N'Jane Addams', N'Harriet Belet', N'F. Hollis', N'Mary E. Richmond', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'The book "Social Group Work – A Helping Process" is authored by?', N'H.B. Trecker', N'G. Konopka', N'G.H. Mead', N'Peter Samuel', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (9, N'Self disclosure is an effective method of——————?', N'Group study', N'Group diagnosis', N'Group relations', N'Group treatment', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'The stages of forming, storming, norming, performing, adjourning is the contribution of ——?', N'Napier', N'Bruce Tuckmen', N'Anne Hopes', N'James Albert', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'The relationship in a secondary group  is ——?', N'Personal', N'Intimate', N'Formal', N'Informal', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N' ————— is a graphic representation of the choices or the association of group members using symbols for people and their interactions.', N'Histogram', N'Sociogram', N'Sonogram', N'Isogram', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'No compromise on law is characteristic of ——leadership?', N'Democratic', N'Autocratic', N'Bureaucratic', N'Laissz Faire', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'Field work in social group work helps to acquire——————?', N'Knowledge', N'Skill', N'Attitude', N'All the above', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'The Mutual Aid Model of group work practice has its roots in the practice theory proposed by————————?', N'H.B. Trecker', N'G. Konopka', N'William Schwartz', N'Naiper', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'————— Model of group work focuses on restoration to normalcy after a point of breakdown?', N'Remedial model', N'Development model', N'Preventive model', N'None of  the above.', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'Cognitive Behavioural  group work model was developed by————————?', N'James Albert', N'Rose', N'Napier', N'Peter Samuel', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'Sociometry is a  technique widely used for study of——————?', N'Group structure', N'Status of members in the group', N'Leadership', N'All the above', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'Groups are classified into primary groups by—————?', N'H.B. Trecker', N'Cooley', N'MacIver', N'Max Weber', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'Which of the following is a principle of group work?', N'To create more groups', N'Planned group formation', N'To provide material help to groups', N'To encourage groupism', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'Which of the following is NOT the objective of social group work?', N'Development of sense of  belonging', N'Development of ego power of individual in the groups', N'Development of the capacity to participate', N'Development of warmth & accepting social climate', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'The process through which the worker guides the group in setting up of formal organization is known as————?', N'Principle of flexible  functional organization', N'Principle of guided group interaction', N'Principle of progressive programme experience', N'Max WebeNone of the abover', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'The principle of specific objective is a principle of ——-————?', N'Social case work', N'Social group work', N'Community organization', N'Social welfare administration', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (10, N'Acceptance in a group is shown——————?', N' By listening to the group members', N'Probing & questioning the group members', N'Solving the problems of the group', N'Doing things for the group members', 1)

INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Sociologists describe the term ''group'' as ….', N'Collection of people', N'People involved in organized pattern of interaction', N'People interacting at a place', N'Participants in a gathering', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Which one of the following is a ''secondary group''?', N'Nuclear family', N'Peer group', N'Association', N'Joint family', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'The success of group work does NOT depend on?', N'Achievement of goals', N'Understanding and agreement on major problems', N'Handling of behavioural problems', N'Ignoring individual problems', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Leader in a group does NOT depend on?', N'Authoritarian Approach', N'Distribution of responsibility', N'Rapport with individual members', N'Understanding group dynamics', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Who among the following helped group work rooted in social work profession?', N'Kurt Lewin', N'H.B. Trecker', N'Murry G. Ross', N'G. Hamilton', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Responsibility for the choice of programme in group work rest with —————?', N'Members of the group', N'Group worker', N'The Agency', N'Members of the group with the help of group worker', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'The basic objective of group work is  ———?', N'Personality development', N'Problem solving', N'Readjustment', N'Remediation', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Value of the programme in group work lies in?', N'Establishing satisfying affective (love) relationship', N'Enhancing knowledge of possible alternative activities.', N'Giving expression to creative dynamics drives', N'Increasing proficiency in the chosen programme activity', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Programme in social group work is base on ———?', N'Interest and resources', N'Interests and resources of the worker', N'Interests and resources of the group', N'None of the above.', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Social group work as a method of  social work aims at———————?', N'Development of democratic life style', N'Development of leadership qualities', N'Development of capability  of adjustment', N'All the above', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Group morale refers to ——————————?', N'Cooperation in a group', N'Coordination in a group', N'Unity in a group', N'Team spirit in a group.', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Which of the following is NOT a principle of social group work? ', N'Confidentiality', N'Guided group interactions', N'Progressive programme development', N'Evaluation of the progress made by the group', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Who was an early pioneer in the settlement house movement in London?', N'Jane Addams', N'Harriet Belet', N'F. Hollis', N'Mary E. Richmond', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'The book "Social Group Work – A Helping Process" is authored by?', N'H.B. Trecker', N'G. Konopka', N'G.H. Mead', N'Peter Samuel', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (11, N'Self disclosure is an effective method of——————?', N'Group study', N'Group diagnosis', N'Group relations', N'Group treatment', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'The stages of forming, storming, norming, performing, adjourning is the contribution of ——?', N'Napier', N'Bruce Tuckmen', N'Anne Hopes', N'James Albert', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'The relationship in a secondary group  is ——?', N'Personal', N'Intimate', N'Formal', N'Informal', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N' ————— is a graphic representation of the choices or the association of group members using symbols for people and their interactions.', N'Histogram', N'Sociogram', N'Sonogram', N'Isogram', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'No compromise on law is characteristic of ——leadership?', N'Democratic', N'Autocratic', N'Bureaucratic', N'Laissz Faire', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'Field work in social group work helps to acquire——————?', N'Knowledge', N'Skill', N'Attitude', N'All the above', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'The Mutual Aid Model of group work practice has its roots in the practice theory proposed by————————?', N'H.B. Trecker', N'G. Konopka', N'William Schwartz', N'Naiper', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'————— Model of group work focuses on restoration to normalcy after a point of breakdown?', N'Remedial model', N'Development model', N'Preventive model', N'None of  the above.', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'Cognitive Behavioural  group work model was developed by————————?', N'James Albert', N'Rose', N'Napier', N'Peter Samuel', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'Sociometry is a  technique widely used for study of——————?', N'Group structure', N'Status of members in the group', N'Leadership', N'All the above', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'Groups are classified into primary groups by—————?', N'H.B. Trecker', N'Cooley', N'MacIver', N'Max Weber', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'Which of the following is a principle of group work?', N'To create more groups', N'Planned group formation', N'To provide material help to groups', N'To encourage groupism', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'Which of the following is NOT the objective of social group work?', N'Development of sense of  belonging', N'Development of ego power of individual in the groups', N'Development of the capacity to participate', N'Development of warmth & accepting social climate', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'The process through which the worker guides the group in setting up of formal organization is known as————?', N'Principle of flexible  functional organization', N'Principle of guided group interaction', N'Principle of progressive programme experience', N'Max WebeNone of the abover', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'The principle of specific objective is a principle of ——-————?', N'Social case work', N'Social group work', N'Community organization', N'Social welfare administration', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (12, N'Acceptance in a group is shown——————?', N' By listening to the group members', N'Probing & questioning the group members', N'Solving the problems of the group', N'Doing things for the group members', 1)
--Advanced Algorithms
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'Which of the following is not an application of Euclid’s algorithm?', N'Simplification of fractions', N'Performing divisions in modular arithmetic', N'Solving quadratic equations', N'Solving diophantine equations', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'According to Gabriel lame, how many steps does Euclid’s algorithm require to solve a problem?', N'Less than five times the number of digits', N'More than five times the number of digits', N'Less than two times the number of digits', N'More than two times the number of digits', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'Which of the following is the correct mathematical application of Euclid’s algorithm?', N'Determination of prime numbers', N'Lagrange’s four square theorem', N'Cauchy-Euler theorem', N'Residue theorem', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'If GCD of two numbers is 1, then the two numbers are said to be ________', N'Co-prime numbers', N'Prime numbers', N'Composite numbers', N'Rational numbers', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'What is the total running time of Euclid’s algorithm?', N'O(N)', N'O(N log M)', N'O(N log N)', N'O(log N +1)', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'What is the total running time of the binary GCD algorithm?', N'O(N)', N'O(N^2)', N'O(log N)', N'O(N log N)', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'What is the GCD of 20 and 12 using Euclid’s algorithm?', N'8', N'2', N'4', N'6', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'What is the minimum number of cuts that a graph with ‘n’ vertices can have?', N'n+1', N'n(n-1)', N'n(n+1)/2', N'n(n-1)/2', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'What is the running time of Karger’s algorithm to find the minimum cut in a graph?', N'O(E)', N'O(|V|^2)', N'O(V)', N'O(|E|)', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'In how many ways can a Gomory-Hu tree be implemented?', N'1', N'2', N'3', N'4', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'Which of the following problems can’t be solved using recursion?', N'Factorial of a number', N'Nth fibonacci number', N'Length of a string', N'Problems without base case', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'Recursion is similar to which of the following?', N'Switch Case', N'Loop', N'If-else', N'if elif else', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'In recursion, the condition for which the function will stop calling itself is ____________', N'Best case', N'Worst case', N'Base case', N'There is no such condition', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'In graph theory collection of dots and lines is called', N'vertex', N'edge', N'graph', N'map', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (13, N'What is a chromatic index?', N'The maximum number of colors required for proper edge coloring of graph', N'The maximum number of colors required for proper vertex coloring of graph', N'The minimum number of colors required for proper vertex coloring of graph', N'The minimum number of colors required for proper edge coloring of graph', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'How many printable characters does the ASCII character set consists of?', N'120', N'128', N'100', N'98', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'How many bits are needed for standard encoding if the size of the character set is X?', N'log X', N'X+1', N'2X', N'X^2', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'The type of encoding where no character code is the prefix of another character code is called?', N'optimal encoding', N'prefix encoding', N'frequency encoding', N'trie encoding', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'What is the running time of the Huffman algorithm, if its implementation of the priority queue is done using linked lists?', N'O(C)', N'O(log C)', N'O(C log C)', N'O(C^2)', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'The Knapsack problem is an example of ____________', N'Greedy algorithm', N'2D dynamic programming', N'1D dynamic programming', N'Divide and conquer', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'Which of the following methods can be used to solve the Knapsack problem?', N'Brute force algorithm', N'Recursion', N'Dynamic programming', N'Brute force, Recursion and Dynamic Programming', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'You are given a knapsack that can carry a maximum weight of 60. There are 4 items with weights {20, 30, 40, 70} and values {70, 80, 90, 200}. What is the maximum value of the items you can carry using the knapsack?', N'160', N'200', N'170', N'90', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'What is the time complexity of the brute force algorithm used to solve the Knapsack problem?', N'O(n)', N'O(n!)', N'O(2^n)', N'O(n^3)', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'In how many directions do queens attack each other?', N'1', N'2', N'3', N'4', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'Where is the n-queens problem implemented?', N'carom', N'chess', N'ludo', N'cards', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'Which of the following methods can be used to solve n-queen’s problem?', N'greedy algorithm', N'divide and conquer', N'iterative improvement', N'backtracking', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'Of the following given options, which one of the following does not provides an optimal solution for 8-queens problem?', N'(5,3,8,4,7,1,6,2)', N'(1,6,3,8,3,2,4,7)', N'(4,1,5,8,6,3,7,2)', N'(6,2,7,1,4,8,5,3)', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'In what time can a binary heap be built?', N'O(N)', N'O(N log N)', N'O(log N)', N'O(N^2)', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'What is the time taken to perform a delete min operation?', N'O(N)', N'O(N log N)', N'O(log N)', N'O(N^2)', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (14, N'What is the average number of comparisons used in a heap sort algorithm?', N'N log N-O(N)', N'O(N log N)-O(N)', N'O(N log N)-1', N'2N log N + O(N)', 4)

INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'Which of the following is not an application of Euclid’s algorithm?', N'Simplification of fractions', N'Performing divisions in modular arithmetic', N'Solving quadratic equations', N'Solving diophantine equations', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'According to Gabriel lame, how many steps does Euclid’s algorithm require to solve a problem?', N'Less than five times the number of digits', N'More than five times the number of digits', N'Less than two times the number of digits', N'More than two times the number of digits', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'Which of the following is the correct mathematical application of Euclid’s algorithm?', N'Determination of prime numbers', N'Lagrange’s four square theorem', N'Cauchy-Euler theorem', N'Residue theorem', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'If GCD of two numbers is 1, then the two numbers are said to be ________', N'Co-prime numbers', N'Prime numbers', N'Composite numbers', N'Rational numbers', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'What is the total running time of Euclid’s algorithm?', N'O(N)', N'O(N log M)', N'O(N log N)', N'O(log N +1)', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'What is the total running time of the binary GCD algorithm?', N'O(N)', N'O(N^2)', N'O(log N)', N'O(N log N)', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'What is the GCD of 20 and 12 using Euclid’s algorithm?', N'8', N'2', N'4', N'6', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'What is the minimum number of cuts that a graph with ‘n’ vertices can have?', N'n+1', N'n(n-1)', N'n(n+1)/2', N'n(n-1)/2', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'What is the running time of Karger’s algorithm to find the minimum cut in a graph?', N'O(E)', N'O(|V|^2)', N'O(V)', N'O(|E|)', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'In how many ways can a Gomory-Hu tree be implemented?', N'1', N'2', N'3', N'4', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'Which of the following problems can’t be solved using recursion?', N'Factorial of a number', N'Nth fibonacci number', N'Length of a string', N'Problems without base case', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'Recursion is similar to which of the following?', N'Switch Case', N'Loop', N'If-else', N'if elif else', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'In recursion, the condition for which the function will stop calling itself is ____________', N'Best case', N'Worst case', N'Base case', N'There is no such condition', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'In graph theory collection of dots and lines is called', N'vertex', N'edge', N'graph', N'map', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (15, N'What is a chromatic index?', N'The maximum number of colors required for proper edge coloring of graph', N'The maximum number of colors required for proper vertex coloring of graph', N'The minimum number of colors required for proper vertex coloring of graph', N'The minimum number of colors required for proper edge coloring of graph', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'How many printable characters does the ASCII character set consists of?', N'120', N'128', N'100', N'98', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'How many bits are needed for standard encoding if the size of the character set is X?', N'log X', N'X+1', N'2X', N'X^2', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'The type of encoding where no character code is the prefix of another character code is called?', N'optimal encoding', N'prefix encoding', N'frequency encoding', N'trie encoding', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'What is the running time of the Huffman algorithm, if its implementation of the priority queue is done using linked lists?', N'O(C)', N'O(log C)', N'O(C log C)', N'O(C^2)', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'The Knapsack problem is an example of ____________', N'Greedy algorithm', N'2D dynamic programming', N'1D dynamic programming', N'Divide and conquer', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'Which of the following methods can be used to solve the Knapsack problem?', N'Brute force algorithm', N'Recursion', N'Dynamic programming', N'Brute force, Recursion and Dynamic Programming', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'You are given a knapsack that can carry a maximum weight of 60. There are 4 items with weights {20, 30, 40, 70} and values {70, 80, 90, 200}. What is the maximum value of the items you can carry using the knapsack?', N'160', N'200', N'170', N'90', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'What is the time complexity of the brute force algorithm used to solve the Knapsack problem?', N'O(n)', N'O(n!)', N'O(2^n)', N'O(n^3)', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'In how many directions do queens attack each other?', N'1', N'2', N'3', N'4', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'Where is the n-queens problem implemented?', N'carom', N'chess', N'ludo', N'cards', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'Which of the following methods can be used to solve n-queen’s problem?', N'greedy algorithm', N'divide and conquer', N'iterative improvement', N'backtracking', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'Of the following given options, which one of the following does not provides an optimal solution for 8-queens problem?', N'(5,3,8,4,7,1,6,2)', N'(1,6,3,8,3,2,4,7)', N'(4,1,5,8,6,3,7,2)', N'(6,2,7,1,4,8,5,3)', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'In what time can a binary heap be built?', N'O(N)', N'O(N log N)', N'O(log N)', N'O(N^2)', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'What is the time taken to perform a delete min operation?', N'O(N)', N'O(N log N)', N'O(log N)', N'O(N^2)', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (16, N'What is the average number of comparisons used in a heap sort algorithm?', N'N log N-O(N)', N'O(N log N)-O(N)', N'O(N log N)-1', N'2N log N + O(N)', 4)

--Physics
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'A boy of mass 50 kg runs with a force of 100 N, his acceleration would be', N'5000 m s^-2', N'50 m s-2', N'150 m s-2', N'2 m s-2', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'An artificial Satellite revolves round the Earth in circular orbit, which quantity remains constant?', N'Angular Momentum', N'Linear Velocity', N'Angular Displacement', N'None of these', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'If electrical conductivity increases with the increase of temperature of a substance, then it is a:', N'Conductor', N'Semiconductor', N'Insulator', N'Carborator', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'Product of Force and Velocity is called:', N'Work', N'Power', N'Energy', N'Momentum', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'Energy possessed by a body in motion is called', N'Kinetic Energy', N'Potential Energy', N'Both A and B', N'None of these', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'What is the scale used for measuring the intensity of the earthquake?', N'Metric Scale', N'Quake Scale', N'Richter Scale', N'Epicentre Scale', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'A body is executing simple harmonic motion. When the displacements from the mean position are 4cm and 5cm, the corresponding velocities of the body are 10cm/sec and 8cm/sec. Then the time period of the body is', N'2π sec', N'π/2 sec', N'π sec', N'3π/2 sec', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'The total energy of a particle performing simple harmonic motion depends on', N'k, a, m', N'k, a', N'k, a, x', N'k, x', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'A linear harmonic oscillator of force constant 2×10^6 N/m and amplitude 0.01m has a total mechanical energy of 160J. Its', N'Potential energy is 160 J', N'Potential energy is zero', N'Potential energy is 100J', N'Potential energy is 120J', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'A loaded vertical spring executes simple harmonic motion with a time period of 4 sec. The difference between the kinetic energy and potential energy of this system varies with a period of', N'2 sec', N'1 sec', N'8 sec', N'4 sec', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'Rocket engines lift a rocket from the earth surface because of hot gases with high velocity', N'Push against the air', N'Push against the earth', N'React against the rocket and push it up', N'Heat up the air which lifts the rocket', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'A machine gun fires 60 bullets per minute, with a velocity of 700m/s. If each bullet has a mass of 50g, find the power developed by the gun.', N'1225W', N'12250W', N'122.5W', N'122W', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'Which of the following is an example for inelastic collision?', N'Collision between two vehicles', N'Collision between glass balls', N'A bullet fired into a wooden block', N'Collision between two railway compartments', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'A satellite revolves very near to the earth surface. Its speed should be around', N'5 km/s', N'8 km/s', N'2 km/s', N'11 km/s', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (17, N'An elephant and an ant are to be projected out of the earth into space. What is the velocity needed to do so?', N'Elephant needs to be projected with a higher velocity', N'Ant should be projected with a higher velocity', N'Both should be projected with the same velocity', N'Elephant cannot be projected to space', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'Wavelength of slow moving neutrons is about', N'10^-34 m', N'10^-20 m', N'10^-19 m', N'10^-10 m', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'High speed electrons from particle detectors are used to determine', N'arrangement of atoms in metals', N'diameter of atomic nuclei', N'inter atomic distance', N'circumference of atomic nuclei', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'Energy of gamma photon is greater than', N'10^2 J', N'10^-13 J', N'10^13 J', N'10^5 J', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'An electron is in an infinite square well that is 8.9-nm wide. The ground state energy of the electron is closest to:', N'0.0066 eV', N'0.0085 eV', N'0.0057 eV', N'0.0047 eV', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'An electron with kinetic energy 2.80 eV encounters a potential barrier of height Uo = 4.70 eV. If the barrier width is 0.4 nm, what is the probability that the electron will tunnel through the barrier?', N'1.1 × 10^-1', N'1.4 × 10^-2', N'2.8 × 10^-2', N'1.4 × 10^-1', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'A low density beam of 60 eV electrons is directed at a potential barrier 130-eV high and 0.12-nm wide. The transmission coefficient is closest to:', N'7.1 × 10^-6', N'1.4 × 10^-4', N'2.8 × 10^-5', N'2.8 × 10^-4', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'How does the probability of an electron tunneling through a potential barrier vary with the thickness of the barrier?', N'It decreases inversely with thickness', N'It decreases sinusoidally with thickness', N'It decreases linearly with thickness', N'It decreases exponentially with thickness', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'Which theory explains the interaction of photons with matter (electrons)?', N'Quantum Chromodynamics.', N'The Standard Model.', N'The Grand Unified Theory.', N'Quantum Electrodynamics.', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'How much of the universe is comprised of matter and energy that is explained by current Physics theory?', N'5%', N'35%', N'70%', N'10%', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'Which of the following formulas can be used to determine the de Broglie wavelength?', N'λ = hmv', N'λ = h/mv', N'λ = mv/h', N'λ = mc/h', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'Knowledge of the wave function of a particle enables the probabilities of the particle’s position, momentum, energy and other characteristics to be calculated. In classical physics, what is the analogue of the wave function?', N'The particle’s momentum.', N'The particle’s energy.', N'The sum of the forces on the particle.', N'The particle’s size.', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'When an electron jumps from an orbit where n = 1 to n = 4, its energy in terms of the energy of the ground level (E1) is:', N'E1/9', N'E1/16', N'16E1', N'4E1', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'The kinetic energy of photoelectrons depends on the:', N'photon frequency.', N'angle of illumination.', N'number of incident photons.', N'intensity of the light.', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'The spontaneous decay of nuclei is called:', N'Absorption', N'neutrons strike a metal target.', N'photons strike electrons.', N'photons are incident on a surface.', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (18, N'The charge on an electron is represented by “e.”  Which of the following charges can exist?', N'2.5 e', N'5.2 e', N'2.0 e', N'3.6 e', 3)

INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'A boy of mass 50 kg runs with a force of 100 N, his acceleration would be', N'5000 m s^-2', N'50 m s-2', N'150 m s-2', N'2 m s-2', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'An artificial Satellite revolves round the Earth in circular orbit, which quantity remains constant?', N'Angular Momentum', N'Linear Velocity', N'Angular Displacement', N'None of these', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'If electrical conductivity increases with the increase of temperature of a substance, then it is a:', N'Conductor', N'Semiconductor', N'Insulator', N'Carborator', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Product of Force and Velocity is called:', N'Work', N'Power', N'Energy', N'Momentum', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Energy possessed by a body in motion is called', N'Kinetic Energy', N'Potential Energy', N'Both A and B', N'None of these', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'What is the scale used for measuring the intensity of the earthquake?', N'Metric Scale', N'Quake Scale', N'Richter Scale', N'Epicentre Scale', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'A body is executing simple harmonic motion. When the displacements from the mean position are 4cm and 5cm, the corresponding velocities of the body are 10cm/sec and 8cm/sec. Then the time period of the body is', N'2π sec', N'π/2 sec', N'π sec', N'3π/2 sec', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'The total energy of a particle performing simple harmonic motion depends on', N'k, a, m', N'k, a', N'k, a, x', N'k, x', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'A linear harmonic oscillator of force constant 2×10^6 N/m and amplitude 0.01m has a total mechanical energy of 160J. Its', N'Potential energy is 160 J', N'Potential energy is zero', N'Potential energy is 100J', N'Potential energy is 120J', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'A loaded vertical spring executes simple harmonic motion with a time period of 4 sec. The difference between the kinetic energy and potential energy of this system varies with a period of', N'2 sec', N'1 sec', N'8 sec', N'4 sec', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Rocket engines lift a rocket from the earth surface because of hot gases with high velocity', N'Push against the air', N'Push against the earth', N'React against the rocket and push it up', N'Heat up the air which lifts the rocket', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'A machine gun fires 60 bullets per minute, with a velocity of 700m/s. If each bullet has a mass of 50g, find the power developed by the gun.', N'1225W', N'12250W', N'122.5W', N'122W', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'Which of the following is an example for inelastic collision?', N'Collision between two vehicles', N'Collision between glass balls', N'A bullet fired into a wooden block', N'Collision between two railway compartments', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'A satellite revolves very near to the earth surface. Its speed should be around', N'5 km/s', N'8 km/s', N'2 km/s', N'11 km/s', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (7, N'An elephant and an ant are to be projected out of the earth into space. What is the velocity needed to do so?', N'Elephant needs to be projected with a higher velocity', N'Ant should be projected with a higher velocity', N'Both should be projected with the same velocity', N'Elephant cannot be projected to space', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Wavelength of slow moving neutrons is about', N'10^-34 m', N'10^-20 m', N'10^-19 m', N'10^-10 m', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'High speed electrons from particle detectors are used to determine', N'arrangement of atoms in metals', N'diameter of atomic nuclei', N'inter atomic distance', N'circumference of atomic nuclei', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Energy of gamma photon is greater than', N'10^2 J', N'10^-13 J', N'10^13 J', N'10^5 J', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'An electron is in an infinite square well that is 8.9-nm wide. The ground state energy of the electron is closest to:', N'0.0066 eV', N'0.0085 eV', N'0.0057 eV', N'0.0047 eV', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'An electron with kinetic energy 2.80 eV encounters a potential barrier of height Uo = 4.70 eV. If the barrier width is 0.4 nm, what is the probability that the electron will tunnel through the barrier?', N'1.1 × 10^-1', N'1.4 × 10^-2', N'2.8 × 10^-2', N'1.4 × 10^-1', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'A low density beam of 60 eV electrons is directed at a potential barrier 130-eV high and 0.12-nm wide. The transmission coefficient is closest to:', N'7.1 × 10^-6', N'1.4 × 10^-4', N'2.8 × 10^-5', N'2.8 × 10^-4', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'How does the probability of an electron tunneling through a potential barrier vary with the thickness of the barrier?', N'It decreases inversely with thickness', N'It decreases sinusoidally with thickness', N'It decreases linearly with thickness', N'It decreases exponentially with thickness', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Which theory explains the interaction of photons with matter (electrons)?', N'Quantum Chromodynamics.', N'The Standard Model.', N'The Grand Unified Theory.', N'Quantum Electrodynamics.', 4)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'How much of the universe is comprised of matter and energy that is explained by current Physics theory?', N'5%', N'35%', N'70%', N'10%', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Which of the following formulas can be used to determine the de Broglie wavelength?', N'λ = hmv', N'λ = h/mv', N'λ = mv/h', N'λ = mc/h', 2)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'Knowledge of the wave function of a particle enables the probabilities of the particle’s position, momentum, energy and other characteristics to be calculated. In classical physics, what is the analogue of the wave function?', N'The particle’s momentum.', N'The particle’s energy.', N'The sum of the forces on the particle.', N'The particle’s size.', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'When an electron jumps from an orbit where n = 1 to n = 4, its energy in terms of the energy of the ground level (E1) is:', N'E1/9', N'E1/16', N'16E1', N'4E1', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'The kinetic energy of photoelectrons depends on the:', N'photon frequency.', N'angle of illumination.', N'number of incident photons.', N'intensity of the light.', 1)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'The spontaneous decay of nuclei is called:', N'Absorption', N'neutrons strike a metal target.', N'photons strike electrons.', N'photons are incident on a surface.', 3)
INSERT [Question] ([testID], [questionContent], [opt1], [opt2], [opt3], [opt4], [rightOption]) VALUES (8, N'The charge on an electron is represented by “e.”  Which of the following charges can exist?', N'2.5 e', N'5.2 e', N'2.0 e', N'3.6 e', 3)
GO

INSERT [User] ([username], [password], [email], [userType]) VALUES (N'user', N'user', N'user1@gmail.com', 2)
INSERT [User] ([username], [password], [email], [userType]) VALUES (N'user2', N'user2', N'user2@gmail.com', 2)
INSERT [User] ([username], [password], [email], [userType]) VALUES (N'admin', N'admin', N'admin1@gmail.com', 1)
GO

INSERT [Mark] ([testID], [userID], [mark]) VALUES (1, 1, 7)
INSERT [Mark] ([testID], [userID], [mark]) VALUES (1, 2, 5)
GO

INSERT [UserResponse] ([userID], [title], [responseContent]) VALUES (1, N'Rat Hay', N'Binh thuong')
