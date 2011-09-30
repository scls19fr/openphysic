/*
Gestion du scrolling vertical d'une page HTML ou d'un iframe
Défile vers le bas.
Quand le bas est atteint défile vers le haut
Quand le haut est atteint, défile vers le bas
etc...
*/

var direction = true; // true=bas false=haut
var scroll = true;

var delay=100;
var step=5;

var obj=null;
var win=null;

function pageScroll(new_obj, new_win) {
  scrolldelay = setTimeout('pageScroll(obj,win)', delay); // scrolls every xxx milliseconds

  obj=new_obj;
  //obj=document.body;
  //obj=document.getElementById('mydata').contentDocument.body;

  win=new_win

  //alert('objet autoscroll "'+obj.value+"'")

  if (scroll) {
    if ( bottom() ) {
      direction=false;
      //alert("bottom");
    }

    if ( top() ) {
      direction=true;
      //alert("top");
    }

    //var win=window;
    //var=top.framename;
    //var=top.frames[1];
    //var win=window.frames[0];

    if ( direction ) {
      //document.getElementById('mydata').scrollBy(0, step);
      //window.scrollBy(0, step);
      win.scrollBy(0, step);
    } else {
      //document.getElementById('mydata').scrollBy(0, -step); 
      //window.scrollBy(0, -step);    
      win.scrollBy(0, -step);
    }
  }
}

function bottom()
{
  if ( (obj.body.scrollTop + obj.body.clientHeight) == obj.body.scrollHeight ) {
    return true;
  } else {
    return false;
  }
}

function top()
{
  if ( obj.body.scrollTop==0 ) {
    return true;
  } else {
    return false;
  }
}

function debug()
{
  alert(obj.body.innerHTML);
  //alert("hello");
}

