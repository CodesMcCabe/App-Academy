const View = require('./ttt-view.js');
const Game = require('/home/cody/Desktop/AA/Week_5/W6D2/solution/game.js')


$( () => {
  const rootEl = $('.ttt');
  const game = new Game();
  new View(game, rootEl);
});

// we pass in the class to the view which we then create the html
// via the view.js
