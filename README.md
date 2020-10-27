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

**3. Using webpack:**

This is my first project using webpack. After a lot of research and few headaches to configure it, I've managed to set it properly. I've a splited the configuration into 3 files, added babel, a linter and css autoprefixer. It's worth the time spent to learn it considering the huge benefits that it brings to the workflow.  

### Pieces I'm proud of:

**1. Algorithm that generate a grid of the desired size**

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
