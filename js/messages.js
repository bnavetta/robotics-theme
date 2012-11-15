//See http://kahthong.com/2011/12/add-close-button-drupal-status-messages

(function ($) {
    /* =============================================================================
     Add 'x' close button and handler to status messages.
     ========================================================================== */
	$(function() {
		$('.messages').each(function() {
			if ($(this).find('a.close').length < 1)
			{
				$(this).append('<a class="close" href="#" title="' + Drupal.t('Close') + '">x</a>');
			}
		});
		$('.messages a.close').click(function(e) {
			e.preventDefault();
			$(this).parent().fadeOut('slow');
		});
	});
})(jQuery);