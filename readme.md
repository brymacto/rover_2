# Mars Rover 2

This is new version of the rover I initially completed months ago during the early days of my Bitmaker Labs program (see the [original repo](https://github.com/brymacto/object_oriented_programming/blob/master/rover.rb) for version 1).

I decided to complete the assignment again, this time using TDD and refactoring techniques.

The priority for this second version of the project was TDD and refactoring of the rover and plateau. The game class and script (game.rb and start_game.rb) are secondary and have not been tested or refactored.

## Instructions

* To run the file, run `ruby start_game.rb`.
* To run the specs, run `rspec spec` (you may need to `gem install rspec`)

## Acceptance criteria

The following acceptance criteria were used to develop the specs for the rover and plateau:

* Rovers are on a plateau that looks like this:

```
  _ _ _ _ _ _ _ _ _
9|_|_|_|_|_|_|_|_|_|        N
8|_|_|_|_|_|_|_|_|_|      W   E
7|_|_|_|_|_|_|_|_|_|        S
6|_|_|_|_|_|_|_|_|_|
5|_|_|_|_|_|_|_|_|_|
4|_|_|_|_|_|_|_|_|_|
3|_|_|_|_|_|_|_|_|_|
2|_|_|_|_|_|_|_|_|_|
1|_|_|_|_|_|_|_|_|_|
0 1 2 3 4 5 6 7 8 9
```

* 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot.
* 'M' means move forward one grid point, and maintain the same heading.
* A rover cannot move into a space occupied by another rover.
* A rover cannot move into a space that is not part of the plateau.



