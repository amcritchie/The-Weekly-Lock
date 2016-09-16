// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

var matchups = {
  init_filter: function() {
    // Matchup filter.
    $('#filter').keyup(function () {
      var rex = new RegExp($(this).val(), 'i');
      $('.searchable li').hide();
      $('.searchable li').filter(function () {
        return rex.test($(this).text());
      }).show();

    })
  },
  init_listeners: function() {
    // Clear and reset performance listeners.
    $('.game-select-performance').off('click').on('click', matchups.click)
  },
  click: function() {
    // Performance id.
    var performance_id = $(this).data('performance-id')
    // Select readable-descriptons.
    var message = $(this).find('.readable-descripton')
    // Select matchup selector.
    var matchup = $(this).closest('.game-box').clone();
    // Remove any gradient coloring.
    matchup.find('.pointer').removeClass('pointer').find('.game-performance-gradient').remove();

    $('.modal-body').html($(this).html())
    $('.modal-body').html(
      '<div class="row"><div class="col-xs-6">' +
      '<img class="game-logo" src="' + $(this).data('logo') + '" alt="Description" height="120"><br><br>' +
      '<h4>' + message.html() + '</h4>' +
      '</div><div class="col-xs-6 game-box">' +
      matchup.html() +
      '</div></div>'
    )
    $('.modal-title').html($(this).data('location') + ' ' + $(this).data('name'));

    if ($('.your-lock').length) {
      $('#confirm-pick').html('Change pick to ' + $(this).data('name') + ' (' + $(this).data('spread') + ')');
    } else {
      $('#confirm-pick').html('Pick ' + $(this).data('name') + ' (' + $(this).data('spread') + ')');
    }

    matchups.confirm_pick(performance_id)
  },
  confirm_pick: function(performance_id){
    $('#confirm-pick').off('click').on('click', function () {
      $.ajax({
        url: "/pick/" + performance_id,
        type: "POST",
        data: {subcomment: { field: 'val', field2: 'val' }
      }, success: function(resp){
        location.reload();
      } });
    })
  }
}

$(document).ready(function() {
  var season = $('#season').data('year')
  var week = $('#week').data('position')
  $('#build_weekly_matchups').on('click', function() {
    $.ajax({
      method: "POST",
      url: '/build_matchups/nfl/' + season + '/' + week,
    })
    .done(function( msg ) {
      alert( "Data Saved: " + msg );
    });
  })
  $('#build_seasons_matchups').on('click', function() {
    $.ajax({
      method: "POST",
      url: '/build_matchups/nfl/' + season,
    })
    .done(function( msg ) {
      alert( "Data Saved: " + msg );
    });
  })
  $('#build_seasons_results').on('click', function() {
    $.ajax({
      method: "POST",
      url: '/build_results/nfl/' + season,
    })
    .done(function( msg ) {
      alert( "Data Saved: " + msg );
    });
  })
  $('#build_weekly_results').on('click', function() {
    $.ajax({
      method: "POST",
      url: '/build_results/nfl/' + season + '/' + week,
    })
    .done(function( msg ) {
      alert( "Data Saved: " + msg );
    });
  })
})
