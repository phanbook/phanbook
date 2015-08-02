/*
 *  jQuery.ui widget for creating tags in an input field
 *
 *  Author: bzums
 *  Version: 1.0.0
 *  Copyright: www.samsam4.org
 *  License: MIT (http://www.opensource.org/licenses/mit-license.php) or GPLv3 (http://www.gnu.org/copyleft/gpl.html) at your own discretion
 *
 */

/* global jQuery */

;(function ( $, window, document, undefined ) {

    var pluginName = 'taginput',

    keys = {
        WHITESPACE: 32,
        ENTER: 13,
        TAB: 9,
        BACKSPACE: 8
    },

    stylePresets = {

        jqueryui: {
            tagTpl: '<span class="taginput-tag ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-secondary"><span class="ui-button-icon-secondary ui-icon ui-icon-close"></span><span class="ui-button-text">{{label}}</span></span>',
            wrapperTpl: '<div class="taginput-wrapper ui-widget ui-widget-content ui-corner-all"></div>',
            deleteHandler: null
        },

        bootstrap: {
            tagTpl: '<span class="taginput-tag btn btn-default btn-sm"><span>{{label}}</span> <span class="glyphicon glyphicon-remove"></span></span>',
            wrapperTpl: '<div class="taginput-wrapper form-control"></div>',
            deleteHandler: null
        }
    },

    defaults = {

        style: 'jqueryui',

        separateKeyCodes: [ keys.WHITESPACE, keys.ENTER, keys.TAB ],

        placeholder: 'Add tag...',

        allowMultiple: false,

        caseSensitive: false,

        onExists: function($tag) {
      		$tag.hide().fadeIn();
    	},

    	tagLabel: function(tag){
    		return tag;
    	},

    	tagValue: function(tag){
      		return tag;
    	}
    };

    // Constructor function
    function Taginput(element, options){

    	this._tags = [];
    	this.$element = $(element);

    	this._defaults = defaults;
        this._name = pluginName;

    	this._create(options);
    }

    Taginput.prototype = {

    	constructor: Taginput,

    	_create: function (options) {

            var self = this;

			this.options = $.extend({}, defaults, options);

            // Determine whether to use a preset or a custom style
            if(typeof this.options.style === 'string'){
                this.style = stylePresets[ this.options.style ];
            }else{
                this.style = this.options.style;
            }

			this.$element.hide();

			this.$input = $('<input type="text" id="tagNames" placeholder="' + this.options.placeholder + '"/>')
				.insertAfter(this.$element);

            this.$input.wrap(this.style.wrapperTpl);
            this.$wrapper = this.$input.parent();

            // Bind events
            this.$input.on( 'keydown.taginput', $.proxy(this._keydown, this));

            // Ease to focus input field
            this.$wrapper.on( 'click.taginput',
            	function(){
                    self.$input.focus();
                }
            );

            // Add initial values
            var initialValues = this.$element.val().split(',');
            $.each(initialValues, function(index, value){
                self.add($.trim(value));
            });
        },

        // Keydown handler for the input field
        _keydown: function(event){

            event.stopPropagation();

            var val = $.trim(this.$input.val());

            // on backspace:
            // check whether there is previous tag to be edited
            if(event.keyCode == keys.BACKSPACE && val === ''){
                this._dissolveLast();
                event.preventDefault();
            }

            // on keys in options.separateKeyCodes:
            // if input field value is not blank create new tag and clear input field
            if($.inArray(event.keyCode, this.options.separateKeyCodes) >= 0){
                this._createTagFromInputField();
                event.preventDefault();
            }

            // on tab:
            // prevent losing focus
            if (event.keyCode == keys.TAB){
                event.preventDefault();
            }
        },

        // Super-simple-minimal-ultrabasic-'template-engine'
        // Used to build a tag elment with given data...
        // which means: replace {{label}} with the given label
        _template: function(str, label){

            var matcher = /{{([\s\S]+?)}}/g;

            return  str.replace(matcher, function(match){

                if(match === '{{label}}'){
                    return label;
                }
            });
        },

        // Creates a tag element and adds it to the DOM
        _createTagView: function(tag){

            var self = this;

            var $tag = $(this._template(
                this.style.tagTpl,
                this.options.tagLabel(tag)
            ));

            // Add taginput object as data
            $tag.data('taginput-data', tag);
            this.$input.before($tag);

            // Add delete handler, if not avoided by setting
            // the deleteHandler to false
            if(this.style.deleteHandler !== false){

                var handler = this.style.deleteHandler;

                // Check if the handler is the tag element itself
                if($tag.is(this.style.deleteHandler)){
                    // When passing null as selector to on(), the
                    // listener is attached to the element on
                    // which on() is called
                    handler = null;
                }

                $tag.on('click.taginput', handler, function(event){
                    event.preventDefault();
                    self.remove(tag);
                });
            }
        },

        // Checks whether there is text in input field, if so:
        // creates tag and clears input field
        _createTagFromInputField: function(){

            var val = $.trim(this.$input.val());
            if(val !== ''){
                if(this.options.getTagObject){
                    val = this.options.getTagObject(val);
                }
                this.add(val);
                this.$input.val('');
            }
        },

        // Edit the latest tag: if there are tags delete the latest
        // one and fill input field with the name of the tag
        _dissolveLast: function(){

            if(this._tags.length > 0){
                var $btn = this.$input.prev(),
                	tag = $btn.data('taginput-data');

                this.remove(tag);
                this.$input.val(this.options.tagLabel(tag));
            }
        },

        // Compares values of two tags w.r.t. to caseSensitive option
        _compareTags: function(a, b){

            // Decide whether to compare case-sensitive
            if(this.options.caseSensitive){
                if( this.options.tagValue(a) === this.options.tagValue(b) ){
                   return true;
                }
            }else{
                if( this.options.tagValue(a).toString().toLowerCase() ===
                    this.options.tagValue(b).toString().toLowerCase() ){
                    return true;
                }
            }

            return false;
        },

        // Returns jQuery element of the tag with given name
        _getTagElem: function(tag){

        	var self = this,
        		$elem = null;

			this.$input.parent().find('.taginput-tag').each(function(index, value){

				var data = $(value).data('taginput-data');
                if(self._compareTags(data, tag)){
                    $elem = $(value);
                }
            });

            return ($elem === null) ? false : $elem;
        },

        // Propagates current items to $element.val
        // Trigger change event on $element
        _pushVal: function(){

        	var self = this,
        		val = $.map(this._tags, function(tag) {
            		return self.options.tagValue(tag).toString();
          	});

      		this.$element.val(val).trigger('change');
        },

        destroy: function () {

            this.$input.off('keydown.taginput');
            this.$input.parent().off('click.taginput');

            this.$input.parent().remove();
            this.$element.removeData(pluginName);
            this.$element.val('');

            return this.$element[0];
        },

        // Checks whether a tag with the given name exists already
        exists: function(tag){

        	var self = this,
                found = false;
        	$.each(this._tags, function(index, value){
                if(self._compareTags(tag, value)){
                    found = true;
                }
            });

            return found;
        },

        // Adds a new tag with given name and data to the widget,
        // but only if the tag name is not present, yet
        add: function(tag){

            var self = this;

            if(this.options.tagValue(tag) === ''){
                return this.$element[0];
            }

            // Call exists if tag already exists
            if(!this.options.allowMultiple && this.exists(tag)){

				if (this.options.onExists && typeof this.options.onExists === 'function') {
         			this.options.onExists.call(this.$element, this._getTagElem(tag));
        		}
            }
            else{

                // User can avoid add via returning false in onAdd event handler
                var avoidAdd = false;

                if (this.options.onAdd && typeof this.options.onAdd === 'function') {
                    avoidAdd = (this.options.onAdd.call(this.$element, tag) === false);
                }

                if(!avoidAdd){

                    // View
                    this._createTagView(tag);

    	            // Model
    	            this._tags.push(tag);

                    // Update original input field value
                    this._pushVal();
                }
	        }

            return this.$element[0];
        },

        // Deletes the tag(s) with the given name
        remove: function(tag){

            var self = this;

            // User can avoid remove via returning false in onRemove event handler
            var avoidRemove = false;

            if (this.options.onRemove && typeof this.options.onRemove === 'function') {
                avoidRemove = (this.options.onRemove.call(this.$element, tag) === false);
            }

            if(!avoidRemove){

                // View
                this._getTagElem(tag).remove();

                // Model
                this._tags = $.grep(this._tags, function(value, index){
                    return self.options.tagValue(value) !== self.options.tagValue(tag);
                });

                this._pushVal();
                this.$input.focus();
            }

            return this.$element[0];
        },

        // Returns array of data of all present tags
        get: function(){

            return this._tags;
        },


        // Deletes all present tags and fills the widget with the given tags
        set: function(tags){

            var self = this;
            self.clear();
            $.each(tags, function(index, value){
                self.add(value);
            });

            return this.$element[0];
        },

        // Deletes all present tags
        clear: function(){

            var self = this;
            $.each(self._tags, function(index, value){
                self.remove(value);
            });

            return this.$element[0];
        },

        // Focus input field
        focus: function(){
            this.$input.focus();
            return this.$element[0];
        },

        // Returns the added input field
        getInputElement: function(){
            return this.$input;
        }
    };

    // Register JQuery plugin
    $.fn[ pluginName ] = function(arg1, arg2) {

        var self = this;
        var results = [];

        this.each(function() {
            var taginput = self.data(pluginName);

            // Initialize a new tags input
            if ( !taginput ) {

                taginput = new Taginput(self, arg1);
                self.data(pluginName, taginput);
                results.push(this);
            } else {

                // Invoke function on existing taginput
                var retVal = taginput[arg1](arg2);
                if (retVal !== undefined)
                results.push(retVal);
            }
        });

        if ( typeof arg1 == 'string') {
            // Return the results from the invoked function calls
            if(results.length > 0){
                // Return jQuery collection if return type of
                // invoked function is a dom element
                if( results[0] !== this[0] ){
                    return results.length > 1 ? results : results[0];
                }
            }
        }

        // Else: return collection of matched elements
        return arrayToJQueryCollection(results);
    };

    // Create a jQuery collection from an array of dom elements
    function arrayToJQueryCollection(arr){

        var $elems = $();

        $.each(arr, function(index, val){
            $elems.push(val);
        });

        return $elems;
    }

})( jQuery, window, document );
