$().ready(function() {
    $('#clandescription').jqm();
});

function padLeft(nr, n, str) {
    return Array(n-String(nr).length+1).join(str||'0')+nr;
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