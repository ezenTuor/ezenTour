/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	CKEDITOR.config.allowedContent = true;
	CKEDITOR.filebrowserUploadMethod = 'form';
	CKEDITOR.on('dialogDefinition', function( ev ){
	    var dialogName = ev.data.name;
	    var dialogDefinition = ev.data.definition;
	 
	    switch (dialogName) {
	    	case 'image': //Image Properties dialog
	        	//dialogDefinition.removeContents('info');
	            dialogDefinition.removeContents('Link');
	            dialogDefinition.removeContents('advanced');
	            break;
	    }
	});
};