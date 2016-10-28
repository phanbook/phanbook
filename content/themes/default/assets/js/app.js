$(document).ready(function () {
    // Placeholder for search form
    var form = document.getElementById('search-top');
    if (form.elements.length) {
        var input = form.elements.q;
        if (input != undefined) {
            var hint = input.getAttribute('data-hint');

            input.onfocus = function(e) {
                if (this.value == hint) {
                    this.value = '';
                }
            };

            input.onblur = function(e) {
                if (this.value == '') {
                    this.value = hint;
                }
            };
        }
    }
});
