<?php
// drupal_add_css(drupal_get_path('theme', 'robotics') . '/bootstrap/css/bootstrap.css', array(
// 	'type' => 'file',
// 	'group' => CSS_THEME,
// 	'every_page' => TRUE,
// 	
// ));
// drupal_add_js(drupal_get_path('theme', 'robotics') . '/bootstrap/js/bootstrap.js');


// Make HTML5 video and audio tags work on older browsers
// https://github.com/etianen/html5media
drupal_add_js("http://api.html5media.info/1.1.5/html5media.min.js", "external");