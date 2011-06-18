if (typeof GF == 'undefined') {
GF = {};

GF.log = function (msg) {
	$('#gfLog').append('<p>' + msg + '</p>');
	$('#gfLog').scrollTop($('#gfLog')[0].scrollHeight);	
}

}