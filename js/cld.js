$(document).ready(function(){
    $("#iop").hide();
    $("#hed2").click(function(){
    $("#iop").show("slide",{direction:"up"},"fast"); 
    });
    $(document).mouseup(function(e){
        if(!$("#iop").is(e.target) && $("#iop").has(e.target).length===0){
            $("#iop").hide("slide",{direction:"up"},"fast");   
        }
    });
});