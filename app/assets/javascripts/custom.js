$(document).ready(function() {
    $("#add").hide();

    $("#plus").click(function() {
        $("#add").slideToggle(1000, 'easeOutBounce');
    });

    $(function() {
        $('#post_body').editable({
            inlineMode: false,
            buttons: ['undo', 'redo', 'sep', 'bold', 'italic', 'underline', 'outdent',
                'indent', 'createLink', 'insertVideo'
            ]
        })
    });
});
