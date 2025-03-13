/**
 * Constructor
 * @constructor
 */
var AdSync = AdSync || function(server_uri, port) {

    /**
     * Configuration
     */
    AdSync.config = {
        'server':   typeof server_uri !== 'undefined' ? server_uri : 'localhost',
        'port':     typeof port !== 'undefined' ? port : '8081',
        'ad_directory': 'assets/ads/'
    };

    // Initialize
    AdSync.init();
};

/**
 * Initialization
 */
AdSync.init = function() {

    // UI Hooks
    AdSync.UI = {
        'ad': $('#ad'),
        'adDOM': $('#ad').get(0),
        clearVideos: function() { AdSync.UI.adDOM.src = ''; AdSync.UI.ad.hide(); },
        play: function() { AdSync.UI.adDOM.play(); },
        stop: function() { AdSync.UI.adDOM.stop(); }
    };

    // Event listener for clearing videos that have finished playing
    AdSync.UI.adDOM.addEventListener('ended', AdSync.UI.clearVideos, false);

    // Connect to Node JS server
    //AdSync.connect();
};

/**
 * Connects to the Node JS server instance
 */
AdSync.connect = function() {
    // Create a new websocket
    //AdSync.websocket = io.connect('http://' + this.config.server + ':' + this.config.port);

    // Listen for messages, and process them according to the type
    //AdSync.websocket.on('notification', function(data) {
    //    var _data = JSON.parse(data);
    //    AdSync.message[_data.message_type]();
    //});
};

/**
 * Messaging API for communication with Node JS
 */
AdSync.message = {

    queueVideo: function(path, id) {

    },

    // Loads a new video into the HTML5 interface and plays it
    playVideo: function(path, id) {
        AdSync.UI.clearVideos();
        AdSync.UI.adDOM.src = 'http://' + AdSync.config.server + '/' + AdSync.config.ad_directory + path + '/' + id;
        AdSync.UI.play();
        AdSync.UI.ad.fadeIn(1000);
    },

    stopVideo: function() {
        AdSync.UI.stop();
        AdSync.UI.clearVideos();
    },

    isPlaying: function() {
        return !AdSync.UI.adDOM.paused;
    }
};

/**
 * Sends a message to the rpi to play a video. Kills any currently playing video
 * @param path
 */
AdSync.playVideo = function(path) {
    $.get('playvideo.php?video='+path+'.mp4');
};
AdSync.playVideoRawPath = function(path) {
    $.get('playvideo.php?video='+path);
};
