$(document).ready(function() {

    if ($("#add").length) {
        $("#add").hide();
        fillPosts();

        if (($(".post").length) == 1) {
            $("article").append("<div class='post blank'><i class='fa fa-cube'></i></div>");
            $("article").append("<div class='post blank'><i class='fa fa-cube'></i></div>");
            $("article").append("<div class='post blank'><i class='fa fa-cube'></i></div>");
        }
    }

    $("#plus, #add-exit, .blank").click(function() {
        $(".blank").last().toggle({
            direction: 'right'
        }, 1000, 'easeOutQuint');
        $("#add").toggle({
            direction: 'left'
        }, 1000, 'easeOutQuint');
    });

    $(".notice, .alert").delay(2000).hide(1000, 'easeOutBounce');

    $(function() {
        $('#post_body').editable({
            inlineMode: false,
            spellcheck: true,
            paragraphy: false,
            borderColor: "#068587",
            buttons: ['undo', 'redo', 'sep', 'bold', 'italic', 'underline', 'outdent',
                'indent', 'createLink'
            ]
        })
    });

    function fillPosts() {

        while (!(($(".post").length) % 3 == 1)) {
            $("article").prepend("<div class='post blank'><i class='fa fa-cube'></i></div>");
        }
    }
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
