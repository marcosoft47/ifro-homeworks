var changeColor = document.getElementById('btn');

changeColor.onclick = colorPicker;

function colorPicker(){
  var rndColor = 'rgb(' + random(255) + ',' + random(255) + ',' + random(255) + ')';
  document.body.style.backgroundColor = rndColor;
}
function random(number) {
  return Math.floor(Math.random()*(number+1));
}