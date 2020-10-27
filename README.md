# Tic Tac Toe game in Ruby
Terminal UI.
Part of the curriculum of [The Hacking Project](https://www.thehackingproject.org/) bootcamp.

## Learning outcomes

### Object Oriented app conception:

* Using classes to blueprint objects. Objects have states (instance variables) and behaviors (methods).

* Encapsulaions: No code in the global scope. Objects interact through their APIs that are public methods only.

* Composition. Objects are nested in other objects to carry more information in a more structured manner.

### Problem solving approach for building the app

* Understanding the problem

* Planning

* Dividing the work

**1. Understanding the problem**

Explaining with words what the program does, this ensure that the problem is clearly understood.

```
The program is a game played by 2 players on a board that is a 3x3 grid.
The players play turn by turn by writing a pawn on a boardcase.
The first one that does a vertical, horizontal or diagonal combination with his pawns wins the game.
If no one does and the board is full, it's tie.
At the end of a round, the program asks what to do next. Ending the game or playing another round.
```

**2. Planning**

#### What can be modelized

What "real world" objects needs to be modelized => to define the classes
``` 
Player, Board, Boardcase, Game & Application
```
* What are the caracteristics of each object type and what actions an object can perform => to define methods and attributes

For exemple for the Player Class

``` 
Players attributes: @name, @turn_to_play, @pawn_shape, @points.
Player methods: #make_a_move 
```

* Which objects need to be composed together

``` 
A Board object need to be composed with Boardcase's objects 
```
#### Describing in pseudo-code

How the program will work step by step as accurately as possible. 
This help to know the choronologic order of the program, where we need condition checks and the pieces that will be parts of loops.

```
1 - Prints welcome message
2 - Ask for player 1 infos
3 - While incorrect user input ask again, if correct initialize player 1 object 
4 - Repeat the same step for player 2 
5 – Initialize a round counter
6 - prints the board
6 - Check player turn to play
8 - print him to play 
9 - While user input incorrect: ask again, if correct make player play 
10 - while player play on an unavailable boardcase ask to play another one
11 - Check if an endgame condition is reached (win combination or board is full)
12 – Print results 
13 – Ask what to do next: End the game or play another round
```

**3. Dividing the work in small pieces**

Using the plan I did previously, I divided each point into sub problems and tried to work with an agile methodoloy, meaning resolving enitrely a sub-problem and getting it to work before moving on the next one. 

#### For the classes 

I took each class and coded as far as possible what I pictured of it: attr_accessor, initialize method, instance variables and methods.
Then later on if functionalities were requiered I went back to the class and added it. 

#### For the game loop

I chosed to do it in chronologic order: 

-Writing the code that will print a welcome message to the console.

-Then the function that asks for players inputs. 

-But I figuered this should go along with player initilization, so I added the logic of players initilization in the function

-...

### To be improved:
1. Exctracting DOM manipulations into it's own module separated from the logic. Currently this is not respecting the single responsability principle.

2. Decoupling. Currently objects are tightly coupled. For exemple, to be created, a `Board` need to know about `BoardCase`s. And `Game` depend on `Player` and `Board`. Fixing this is possible using a Pub/Sub pattern.

## Installation

+ Clone this repo
```
git clone https://github.com/Ggs91/Ruby-TicTacToe.git
```
+ Enter the repo
```
cd Ruby-TicTacToe
```
+ Launch the game
```
ruby app.rb
```

## Screenshots
![](/screenshots/screen1.png)
![](/screenshots/screen2.png)
## Author
**Georges Atalla**

Email - georges_atalla@hotmail.fr

Github - https://github.com/Ggs91/
