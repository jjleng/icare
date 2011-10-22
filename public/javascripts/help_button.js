/**
 * Created by JetBrains RubyMine.
 * User: cool_curly
 * Date: 10/20/11
 * Time: 12:17 AM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function() {
//    $("a[rel=twipsy]").twipsy({
//        placement: 'right',
//        trigger: 'manual'
//    });

    $(".help_btn").twipsy({
        placement: 'right',
        trigger: 'manual'
    });

    $('.help_btn').click(function(event) {
        event.preventDefault();
        $(this).twipsy('show');
//        $("a[rel=twipsy]").twipsy('show');
    });
});
