<div class="comment_respond clearfix m_bottom_50" id="respond">
    <h3 class="comment_reply_title" id="reply-title">
        {l s='Leave a comment' d='Shop.Theme.Blog'}
    </h3>
    <form class="comment_form" action="" method="post" id="xipblogs_commentfrom" role="form" data-toggle="validator">
    	<div class="form-group xipblog_name_parent">
    	  <label for="xipblog_name">{l s='Your Name:' d='Shop.Theme.Blog'}</label>
    	  <input type="text"  id="xipblog_name" name="xipblog_name" class="form-control xipblog_name" required>
    	</div>
    	<div class="form-group xipblog_email_parent">
    	  <label for="xipblog_email">{l s='Your Email:' d='Shop.Theme.Blog'}</label>
    	  <input type="email"  id="xipblog_email" name="xipblog_email" class="form-control xipblog_email" required>
    	</div>
    	<div class="form-group xipblog_subject_parent">
    	  <label for="xipblog_subject">{l s='Subject:' d='Shop.Theme.Blog'}</label>
    	  <input type="text"  id="xipblog_subject" name="xipblog_subject" class="form-control xipblog_subject" required>
    	</div>
    	<div class="form-group xipblog_content_parent">
    	  <label for="xipblog_content">{l s='Comment:' d='Shop.Theme.Blog'}</label>
    	  <textarea rows="15" cols="" id="xipblog_content" name="xipblog_content" class="form-control xipblog_content" required></textarea>
    	</div>
    	<input type="hidden" class="xipblog_id_parent" id="xipblog_id_parent" name="xipblog_id_parent" value="0">
    	<input type="hidden" class="xipblog_id_post" id="xipblog_id_post" name="xipblog_id_post" value="{$xipblogpost.id_xipposts}">
    	<input type="submit" id="xipblog_submit_comment" class="btn btn-default pull-left xipblog_submit_btn" value="{l s='Submit' d='Shop.Theme.Blog'}">
    </form>
    <div class="xipblogs_message"></div>

</div>
{xipblog_js name="single_comment_form"}
<script type="text/javascript">
// disabled
$('.xipblog_submit_btn').on("click",function(e) {
	e.preventDefault();
    $('.xipblogs_message').html('');
	if(!$(this).hasClass("disabled")){
		var data = new Object();
		$('[id^="xipblog_"]').each(function()
		{
			id = $(this).prop("id").replace("xipblog_", "");
			data[id] = $(this).val();
		});
		function logErrorMessage(element, index, array) {
		  $('.xipblogs_message').append('<li>'+element+'</li>');
		}
		function xipremove() {
		  $('.xipblogs_error').remove();
		  $('.xipblogs_success').remove();
		}
		$.ajax({
			url: xprt_base_dir + 'modules/xipblog/ajax_mail.php', // Modif du chemin vers fichier de traitement car plein d'anomalies dans l'original
			data: data,
			type:'post',
			dataType: 'json',
			beforeSend: function(){
				xipremove();
				$(".xipblog_submit_btn").val("{l s='Please wait' d='Shop.Theme.Blog'}");
				$(".xipblog_submit_btn").addClass("disabled");
			},
			complete: function(){
				$(".xipblog_submit_btn").val("{l s='Submit' d='Shop.Theme.Blog'}");
				$(".xipblog_submit_btn").removeClass("disabled");	
			},
			success: function(data){
				xipremove();
				if(typeof data.success != 'undefined'){
                     $('.xipblogs_message').html('<div class="alert alert-success">'+data.success+'</div>');
                    $('#xipblogs_commentfrom')[0].reset();
				}
				if(typeof data.error != 'undefined'){
                    var errors_list = '';
                    $.each(data.error, function(k,v){
                        errors_list += '<li>'+v+'</li>';
                    });
                    $('.xipblogs_message').html('<div class="alert alert-danger"><ol>'+errors_list+'</ol></div>');
				}
			},
			error: function(data){
				xipremove();
				$('.xipblogs_message').append('<div class="alert alert-danger">{l s='An error occured. Please try again' d='Shop.Theme.Blog'}</div>');
			},
		});	
	}
});
</script>
{/xipblog_js}