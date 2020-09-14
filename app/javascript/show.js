function pullDown() {
  const pullDownButton = document.getElementById('lists');
  const pullDownParent = document.getElementById('pull-down');
  
  pullDownButton.addEventListener('click', function() {
    if (pullDownParent.getAttribute("style") == "display:block;") {
      pullDownParent.removeAttribute("style", "display:block;");
    } else {
      pullDownParent.setAttribute("style", "display:block;");
    }
  });
}

window.addEventListener('load', pullDown);
