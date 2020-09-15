// function pullDown() {
//   const pullDownButton = document.getElementById('lists');
// console.log(pullDownButton);
//   const pullDownParent = document.getElementById('pull-down');
  
//   pullDownButton.addEventListener('click', function() {
//     if (pullDownParent.getAttribute("style") == "display:block;") {
//       pullDownParent.removeAttribute("style", "display:block;");
//     } else {
//       pullDownParent.setAttribute("style", "display:block;");
//     }
//   });
// }

// window.addEventListener('load', pullDown);

(function () {
  document.addEventListener('DOMContentLoaded', function() { // HTML解析が終わったら
    const btn = document.getElementById('lists');
    const pullDownParent = document.getElementById('pull-down');
    // ボタンをidで取得
    if(btn) { // ボタンが存在しないときにエラーになるのを回避
      btn.addEventListener('click', function(){ //ボタンがクリックされたら
        if (pullDownParent.getAttribute("style") == "display:block;") {
          pullDownParent.removeAttribute("style", "display:block;");
        } else {
          pullDownParent.setAttribute("style", "display:block;");
        }
      });
    }
  });
}());
