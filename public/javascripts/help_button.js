/**
 * Created by JetBrains RubyMine.
 * User: cool_curly
 * Date: 10/20/11
 * Time: 12:17 AM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function(){
    $('[rel=twipsy]').twipsy();

  $('.help_btn').click(function(event){
        event.preventDefault();
        $(this).twipsy('show');
      });
});
