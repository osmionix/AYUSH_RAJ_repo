JAVASCRIPT ASSIGNMENT – 2
BRAIN BLITZ - QUIZ GAME

Introduction
Brain Blitz is an interactive quiz game where players can test their knowledge across different categories and difficulty levels. 
The game fetches questions from an online API, tracks the player's score, and provides real-time feedback. Players can restart the game after completion.

Features
•	Category Selection: Players can choose from different categories such as General Knowledge, Computers, and Sports.
•	Difficulty Levels: Options include Easy, Medium, and Hard.
•	Live Score Tracking: Displays the player's current score throughout the game.
•	Timer & Progress Bar: A countdown timer with a progress bar for each question.
•	Randomized Answer Options: Ensures dynamic question presentation.
•	Final Score Display: Shows the player's total score at the end.
•	Restart Functionality: Allows users to restart the quiz from the beginning, after the end of current round.

Tech Stack
•	HTML - Structuring the web pages.
•	CSS - Styling the interface.
•	JavaScript - Handling game logic, API requests, and user interactions.
•	Open Trivia Database API - Fetching quiz questions.
 
How to Play the Game
1.	Select a Category and Difficulty Level.
2.	Click Start Game to begin.
3.	Answer the questions by clicking on one of the multiple-choice options.
4.	Keep track of your score, timer, and progress bar.
5.	If the timer runs out, the correct answer is shown.
6.	After answering all questions, the final score is displayed.
7.	Click Play Again to restart the quiz.

Files Included
•	index.html - The start page where users select quiz options.
•	game.html - The main quiz interface displaying questions and answers.
•	end.html - The final score screen.
•	style.css - Stylesheet for the UI.
•	game.js - Game logic, including fetching questions, tracking the score, and updating UI.
•	end.js - Handles the final score display and restart functionality.

Notes
•	The game retrieves randomized questions from the Open Trivia Database API.
•	Uses localStorage to temporarily store selected category, difficulty, and score.
•	Questions and answers are shuffled dynamically for an engaging experience.
•	The progress bar visually represents the countdown timer.
•	The game works best on modern browsers that support JavaScript.
