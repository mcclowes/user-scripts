// ==UserScript==
// @name         YouTube Subscriber Tool
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Go to a subscription feed, scroll to the bottom within the 120s alloted, and voila
// @author       You
// @match        https://www.youtube.com/channel/*/channels?*view=*
// @grant        none
// ==/UserScript==

(function(){
    setTimeout(
        function(){
            var buttons = document.getElementsByClassName("yt-uix-button yt-uix-button-size-default yt-uix-button-subscribe-branded yt-uix-button-has-icon no-icon-markup yt-uix-subscription-button yt-can-buffer style-scope ytd-subscribe-button-renderer");

            for( var i = 0; i < buttons.length; i++ ){
                if( buttons[i] && buttons[i].parentNode && buttons[i].parentNode.parentNode && buttons[i].parentNode.parentNode.parentNode ){
                    if( buttons[i].parentNode.parentNode.parentNode.attributes["aria-label"].value === "Subscribe to this channel.") {
                        buttons[i].click();
                    }
                }
            }

            alert("Success!");
        }, 120000
    );
})();
