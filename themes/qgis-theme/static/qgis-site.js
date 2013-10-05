

$(document).ready(function(){

    // make every external link open in new window
    // idea from http://css-tricks.com/snippets/jquery/open-external-links-in-new-window/
    $('a.reference.external').each(function() {
        $(this).click(function(event) {
            event.preventDefault();
            event.stopPropagation();
            window.open(this.href, '_blank');
        });
    });

});
