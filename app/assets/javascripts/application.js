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

// Logic for filter.
$(document).ready(function () {
  (function ($) {
    $('#filter').keyup(function () {
      var rex = new RegExp($(this).val(), 'i');
      $('.searchable li').hide();
      $('.searchable li').filter(function () {
        return rex.test($(this).text());
      }).show();

    })
  }(jQuery));
});

var pick = {
  init_listeners: function() {
    $('.game-select-away').
    mouseenter(function() {
      $(this).closest('.flex-item').find('.game-away-gradient').animate({ opacity: 1 }, 100);
    }).
    mouseleave(function() {
      $(this).closest('.flex-item').find('.game-away-gradient').animate({ opacity: 0 }, 100);
    }).
    click(pick.click)

    $('.game-select-home').
    mouseenter(function() {
      $(this).closest('.flex-item').find('.game-home-gradient').animate({ opacity: 1 }, 100);
    }).
    mouseleave(function() {
      $(this).closest('.flex-item').find('.game-home-gradient').animate({ opacity: 0 }, 100);
    }).
    click(pick.click)
  },
  click: function() {

    var performance_id = $(this).data('performance-id')
    // message = $(this).siblings('.game-select-performance').find('.game-performance-gradient')
    message = $(this).siblings('.game-select-performance').find('.full-name')
    message = $(this).siblings('.game-select-performance').find('.readable-descripton')
    // opponent = $(this)

    $(this).data('name')
    $(this).data('location')
    $(this).data('spread')
    // debugger;

    $(this).find('.game-performance-gradient').html()

    // var match_up = $(this).closest('.game-box').html()
    var match_up = $(this).closest('.game-box').clone();
    // debugger;
    // match_up.find('.gradient').remove();
    match_up.find('.pointer').removeClass('pointer').find('.gradient').remove();
    // debugger;
    // gradient
    // console.log('==========')
    // debugger;
    // console.log($(this).data('logo'));
    // console.log('==========')
    // $('.modal-body').html("hello")
    $('.modal-body').html($(this).html())
    $('.modal-body').html(
      '<div class="row"><div class="col-xs-6">' +
      '<img class="game-logo" src="' + $(this).data('logo') + '" alt="Description" height="138"><br><br>' +
      // message.html().split('</h5>')[1] +
      '<h4>' + message.html() + '</h4>' +
      '</div><div class="col-xs-6 game-box">' +
      match_up.html() +
      '</div></div>'
      // $(this).data('name')
    )
    // $('.modal-title').html($(this).data('name') + ' ' + $(this).data('spread'));
    $('.modal-title').html($(this).data('location') + ' ' + $(this).data('name'));
    // $('#confirm-pick').html(message.html());
    $('#confirm-pick').html('Pick ' + $(this).data('name') + ' (' + $(this).data('spread') + ')');

    $('#confirm-pick').off('click').on('click', function () {
      $.ajax({
        url: "/pick/" + performance_id,
        type: "POST",
        data: {subcomment: {
          field: 'val',
          field2: 'val'
        }
      },
      success: function(resp){
        debugger;
      }
    });
    // debugger;
    // ''
  })
}
}


$(document).ready(function () {
  pick.init_listeners();
  // $('.game-select-away').hover( function() {
  //   $('.away_gra').animate({ opacity: 1 });
  // })

  $('.game-select-away-x').
  mouseenter(function() {
    $(this).closest('.flex-item').find('.game-away-gradient').animate({ opacity: 1 }, 100);
  }).
  mouseleave(function() {
    $(this).closest('.flex-item').find('.game-away-gradient').animate({ opacity: 0 }, 100);
  }).
  click(function() {

    var performance_id = $(this).data('performance-id')
    $(this).data('name')
    $(this).data('spread')
    // debugger;

    $(this).find('.game-performance-gradient').html()

    // $('.modal-body').html("hello")
    $('.modal-body').html($(this).html())
    $('.modal-body').html(
      ' <img class="game-logo" src="' + $(this).data('logo') + '" alt="Description" height="160">' + $(this).find('.game-performance-gradient').html()
      // $(this).data('name')
    )
    $('.modal-title').html($(this).data('name') + ' ' + $(this).data('spread'));

    $('#confirm-pick').off('click').on('click', function () {
      $.ajax({
        url: "/pick/" + performance_id,
        type: "POST",
        data: {subcomment: {
          field: 'val',
          field2: 'val'
        }
      },
      success: function(resp){ debugger; }
    });
  })
}
);
$('.game-select-home-x').mouseenter(
  function() {
    $(this).closest('.flex-item').find('.game-home-gradient').animate({ opacity: 1 }, 100);
  }).mouseleave(
    function() {
      $(this).closest('.flex-item').find('.game-home-gradient').animate({ opacity: 0 }, 100);
    } );

    // $('.game-select-away').on('mouseover', function(a,b,c) {
    //   console.log('alex')
    //   // $('.away_gra').css(visibility: 'visible', opacity: '1')
    //   $('.away_gra').animate({ opacity: 1 });
    // })
  });




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
