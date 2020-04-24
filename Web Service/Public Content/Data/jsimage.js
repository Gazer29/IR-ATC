/*global $*/

/*
updateFPimage gets the newest version of the Front Panel
image from the server. To prevent the browser from loading
a cached version of the image, we add a query to the URL 
for the image. We're using the time, but any query that is
guaranteed not to repeat would be fine.
*/
function updateFPimage() {
    //use strict prevents the use of undeclared variables
    "use strict";
    var d = new Date();
    $("#fpimg").attr("src", "MonitorUpdate?" + d.getTime());
}

$(document).ready(function () {
    //use strict prevents the use of undeclared variables
    "use strict";
    
    //setInterval calls updateFPimage every 200 ms
    setInterval(updateFPimage, 2000);
});