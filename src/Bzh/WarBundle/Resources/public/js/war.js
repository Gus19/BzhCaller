$().ready(function() {
    if($('.prepday').size() > 0) {
        countdownStart();
        setInterval(countdownStart, 60000);
    }
    if($('.warday').size() > 0) {
        countdownEnd();
        setInterval(countdownEnd, 60000);
    }
    
    $('#clandescription').jqm({ onShow:screenCenter('#clandescription') });
    $('#targetcomment').jqm({ onShow:screenCenter('#targetcomment') });
    $('#targethdv').jqm({ onShow:screenCenter('#targethdv') });
    $('#targetattack').jqm({ onShow:screenCenter('#targetattack') });
    $('#resultattack').jqm({ onShow:screenCenter('#resultattack') });
});

function padLeft(nr, n, str) {
    return Array(n-String(nr).length+1).join(str||'0')+nr;
}

function screenCenter(el) {
  $(el).css("top", Math.max(0, 30) + "px");
  $(el).css("left", Math.max(0, (($(window).width() - $(el).outerWidth()) / 2) ) + "px");
}

function StringToDate(dateStr) {
    var a=dateStr.split(" ");
    var d=a[0].split("-");
    var t=a[1].split(":");
    return new Date(d[0],(d[1]-1),d[2],t[0],t[1],t[2]);
}

function calcDiff(eventDate, currentDate) {
    var diff = eventDate - currentDate;
    
    var days = parseInt(Math.floor(diff / 86400000));
    diff = diff % 86400000;

    var hours =  parseInt(Math.floor(diff / 3600000));
    diff = diff % 3600000;

    // the same for minutes
    var minutes = parseInt(Math.floor(diff / 60000));
    diff = diff % 60000;

    var seconds = parseInt(Math.floor(diff / 1000));
    
    return { 
        'days': days, 
        'hours': hours, 
        'minutes': minutes, 
        'seconds': seconds 
    };
}

function countdown(dateStr, className) {
    var eventDate = StringToDate(dateStr);

    if(!eventDate) {
        return true;
    }

    var currentDate = new Date();
    if(currentDate >= eventDate) {
        return false;
    }

    var diff = calcDiff(eventDate.getTime(), currentDate.getTime());

    if(diff['hours'] === 0) {
        diff['minutes']++;
        $(className).html(diff['minutes'] + 'm');
    }
    else {
        $(className).html(diff['hours'] + 'h' + padLeft(String(diff['minutes']),2) + 'm');
    }
    return true;
}

var lasttargetid;
function addComment(targetid) {
    if(targetid === lasttargetid) {
        $('#targetcomment').jqmShow();
        return;
    }
    $('#targetcomment').jqmShow();
    $('#targetcomment').html('chargement ...');
    $.get(Routing.generate('war_target_comment', { id: targetid }), function( data ) {
        $('#targetcomment').html(data);
        lasttargetid = targetid;
    });
}
/*function addComment(targetid, position, comment) {
    $('#target_comment').attr('action', Routing.generate('war_target_comment', { id: targetid }));
    $('#targetcomment h4').html('Commentaire cible #' + position);
    $('#target_comment_comment').val(comment);
    $('#targetcomment').jqmShow();
}*/
function addReservation(targetid, position) {
    $('#target_attack').attr('action', Routing.generate('war_target_attack', { code: warcode, id: targetid }));
    $('#targetattack h4').html('Réserver cible #' + position);
    $('#targetattack').jqmShow();
}

function deleteAttack(attackid) {
    if(confirm("Supprimer cette réservation ?")) {
        window.location.replace( Routing.generate('war_delete_attack', { code: warcode, id: attackid }) );
    }
}

function editReservation(attackid, name) {
    $('#target_attack').attr('action', Routing.generate('war_edit_attack', { code: warcode, id: attackid }));
    $('#targetattack h4').html('Modifier réservation');
    $('#target_attack_name').val(name);
    $('#targetattack').jqmShow();
}
function changeHdv(targetid, hdv) {
    $('#target_hdv').attr('action', Routing.generate('war_target_hdv', { code: warcode, id: targetid }));
    $('#target_hdv_hdv').val(hdv);
    $('#targethdv').jqmShow();
}
function setResultAttack(attackid, stars, destruction) {
    $('#result_attack').attr('action', Routing.generate('war_result_attack', { code: warcode, id: attackid }));
    $('#result_attack_stars').val(stars);
    $('#result_attack_destruction').val(destruction);
    $('#resultattack').jqmShow();
}

function checkReservation() {
    if( players.indexOf( $("#target_attack_name").val() ) == -1) {
        return false;
    }
    else {
        return true;
    }
}