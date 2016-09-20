$(document).ready(function(){
   $("#second-page").hide();
   $("#knw").click(function(){
      $("#first-page").hide("slide", { direction: "left" },"fast");
      $("#second-page").show("slide", { direction: "right" },"fast");
   });
   $("#bck").click(function(){
       $("#second-page").hide("slide", { direction: "left" },"fast");
      $("#first-page").show("slide", { direction: "right" },"fast");
      
   });
});