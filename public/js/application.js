var symbol
$(document).ready(function () {
  getPlayerSymbol()

  $('td').on("click", conductMoveCycle)

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

});

function getPlayerSymbol(){
  url = window.location.pathname+'/symbol';
  console.log(url)
  var request = $.ajax({
    url: url,
    method: "GET"
  });
  request.done(function(response){debugger; symbol = response; console.log(symbol)});

  // TODO: Establish route that returns symbol based on integer input.
  // Return symbol as string.
}
function conductMoveCycle(){
  showMove();
  checkForWinner();
  sendMove();
  setIdle();
  listenForResponse();
}

function showMove(){
  // Set clicked <td> to symbol.
}
function sendMove(){
  // Put together a string including the coordiantes of the move, and the symbol associated with it.
  // Post that string using AJAX.
  // TODO: Implement the setting of game.last_move in the controller.

}
function setIdle(){
  // Unbind all click events on page.
  // Append a message saying to wait for the other player to move.

}

function listenForResponse(){
  // setInterval(1000, getResponse)
  // getResponse posts to /game/:id/state, receives back a string.
  // If response is a new move, rebinds conductMoveCycle to <td> click.
}
