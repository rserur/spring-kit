$(document).ready(function() {
    $("#add").hide();

    $("#plus").click(function() {
        $("#add").slideToggle(1000, 'easeOutBounce');
    });

    $(".notice, .alert").delay(2000).hide(1000, 'easeOutBounce');

    $(function() {
        $('#post_body').editable({
            inlineMode: false,
            spellcheck: true,
            borderColor: "#068587",
            buttons: ['undo', 'redo', 'sep', 'bold', 'italic', 'underline', 'outdent',
                'indent', 'createLink'
            ]
        })
    });
});

$('div[data-type="background"]').each(function() {
    var $bgobj = $(this);

    $(window).scroll(function() {
        var yPos = -($window.scrollTop() / $bgobj.data('speed'));

        var coords = '50%' + yPos + 'px';

        $bgobj.css({
            backgroundPosition: coords
        });
    });

});
