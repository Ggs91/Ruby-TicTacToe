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

I made a function that generate an array of cases names depending on the desired gridsize.
For exemple for a regular 3x3 grid size it will return ["a1", "a2", "a3", ... , "c1", "c2", "c3"].
```
// src/lib/board.js

function _generateBoardCasesIDsArray(gridSize) {
  const arrayOfCases = [];
  const gridColumnID = Array.from({ length: gridSize }, (_, i) =>
    String.fromCharCode("a".charCodeAt(0) + i)
  ); // ["a", "b", "c"...]
  const gridRowsID = [...Array(gridSize + 1).keys()].slice(1); // ["1", "2", "3"...]

  gridColumnID.forEach((columnID) => {
    gridRowsID.forEach((rowID) => {
      arrayOfCases.push(columnID + rowID);
    });
  });

  return arrayOfCases; // ["a1", "a2", "a3", "b1"...]
}
```
This can then be used by another method that will iterate over it and create the `BoardCase`s assigning each case an id of this array.
```
// src/lib/board.js

const boardCases = (function (gridSize) {
  // Instanciation of the boardcases. "boardCases" variable is assigned the return of the IIFE invokation
  const boardCasesIDs = _generateBoardCasesIDsArray(gridSize);
  return boardCasesIDs.map((caseID) => BoardCase(caseID, doc));
})(3); // Here we select a 3x3 grid size
```
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
