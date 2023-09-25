const colors = ['blue', 'green', 'red', 'yellow'];

window.onload = () => {
    functionRandomColor();
}

function functionChangeColor() {
    var divs = document.querySelectorAll('#container div');
    for (i = 0; i < divs.length; i++) {
        var div = divs[i];
        div.addEventListener('click', function () {
            changeBgColor(this.id);
        })
    }
}

function changeBgColor(color) {
    document.getElementsByTagName('body')[0].style.backgroundColor = color;
}

function giveRandomColor(id) {
    var color = colors[Math.floor(Math.random() * colors.length)];
    document.getElementById(id).style.backgroundColor = color;
}

function functionRandomColor() {
    var divs = document.querySelectorAll('#container div');
    for (i = 0; i < divs.length; i++) {
        var div = divs[i];
        div.addEventListener('click', function () {
            giveRandomColor(this.id);
        })
    }
}




