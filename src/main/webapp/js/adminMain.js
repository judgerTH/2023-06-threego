$(function(){
    var accordionButton = $('.list .items > .a_title');
    accordionButton.on('click', function(e){
        e.preventDefault();
        var $this = $(this);
        var target = $this.parent();
        var description = $this.siblings('.a_content');
        var other = target.siblings('.items');
        var otherDescription = other.find('.a_content');
        accordionToggle(target, description, other, otherDescription);
    });
    function accordionToggle(target, description, other, otherDescription){
        if (target.hasClass('active')) {
            target.removeClass('active');
            description.stop().slideUp(300);
        } else {
            target.addClass('active');
            description.stop().slideDown(300);
        }
        if (other && otherDescription) {
            other.removeClass('active');
            otherDescription.stop().slideUp(300);
        }
    };
});




