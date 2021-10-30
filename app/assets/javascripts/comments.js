// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// TODO : AJAX on creation or deletion of comment


Comments = {};

Comments.removeComment = function(commentID) {
    document.getElementById("comment-"+commentID).remove();
};