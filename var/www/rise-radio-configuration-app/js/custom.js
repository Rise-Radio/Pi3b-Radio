/*$(document).ready(function () {
  $outputVolumeEl = $("#outputVolume");

  if ($outputVolumeEl.length) {
    $("#outputVolume").ionRangeSlider({
      min: 0,
      max: 100,
      from: 40
    });
  }
});
*/
const fullscreenElement = document.documentElement;

function openFullscreen() {
  if (fullscreenElement.requestFullscreen) {
    fullscreenElement.requestFullscreen();
  } else if (fullscreenElement.mozRequestFullScreen) { /* Firefox */
    fullscreenElement.mozRequestFullScreen();
  } else if (fullscreenElement.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
    fullscreenElement.webkitRequestFullscreen();
  } else if (fullscreenElement.msRequestFullscreen) { /* IE/Edge */
    fullscreenElement.msRequestFullscreen();
  }
}

function inetStatus(){
  // onload status update for status page
  	$.ajax({
  		url: 'inet-status.php',
  		success: function (data) {
        //console.log("php return: "+data);
        //$('#inet-status').html(data);
        if(data.includes('Up')){
          $("#status-up").addClass("status__active--up");
          $("#status-up").removeClass("status__inactive");
        } else {
          $("#status-down").addClass("status__active--down");
          $("#status-down").removeClass("status__inactive");
        };
  		},
  		error: function (xhr, status, error) {
  			//If error, alert the error to the user
  			if (xhr.status > 0) alert('got error: ' + status);
  		}
  	});

    $.ajax({
      url: 'hostname-status.php',
      success: function (data) {
        //console.log("php return: "+data);
        $('#hostname-status').html(data);
      },
      error: function (xhr, status, error) {
        //If error, alert the error to the user
        if (xhr.status > 0) alert('got error: ' + status);
      }
    });

    $.ajax({
      url: 'wifi-status.php',
      success: function (data) {
        //console.log("php return: "+data);
        if (data.includes('Quality')){
          $('#wifi-status').html(data);
          $("#wifi-up").addClass("status__active--up");
          $("#wifi-up").removeClass("status__inactive");
        } else {
          $('#wifi-status').html("Wifi Data Not Active");
          $("#wifi-down").addClass("status__active--down");
          $("#wifi-down").removeClass("status__inactive");
        }

      },
      error: function (xhr, status, error) {
        //If error, alert the error to the user
        if (xhr.status > 0) alert('got error: ' + status);
      }
    });

    $.ajax({
      url: 'now-playing.php?what=video',
      success: function (data) {
        //console.log("php return: "+data);
        $('#video-playing').html(data);
      },
      error: function (xhr, status, error) {
        //If error, alert the error to the user
        if (xhr.status > 0) alert('got error: ' + status);
      }
    });

    $.ajax({
      url: 'now-playing.php?what=getaudio',
      success: function (data) {
        //console.log("php return: "+data);
        $('#audio-playing').html(data);
      },
      error: function (xhr, status, error) {
        //If error, alert the error to the user
        if (xhr.status > 0) alert('got error: ' + status);
      }
    });

}

//When user clicks update playlist button
$(".update-playlist-button").click (function (){
	//Append loading spinner
	$(".page-title").append('<div class="loading">Loading&#8230;</div>');
	//Load file which contains the command
	$.ajax({
		url: 'update-playlist.php',
		success: function (data) {
      // unpress the button
      $(".update-playlist-button").blur();
			//If success remove the spinner
			$(".loading").remove();
		},
		error: function (xhr, status, error) {
			//If error, alert the error to the user
			if (xhr.status > 0) alert('got error: ' + status);
		}
	});

});


//When user clicks reboot button
$(".reboot-button").click (function (){
	//Append loading spinner
	//$(".page-title").append('<div class="loading">Loading&#8230;</div>');
	//Load reboot.php file which contains the reboot command
	$.ajax({
		url: 'reboot.php',
    beforeSend: function() {
        setTimeout("alert('Reboot has been initiated.  Refresh browser in approximately 1 minute.');", 1);
    },
		success: function (data) {
			//If success remove the spinner
			//$(".loading").remove();
		},
		error: function (xhr, status, error) {
			//If error, alert the error to the user
			if (xhr.status > 0) alert('got error: ' + status);
		}
	});

});

//When user clicks shutdown button
$(".shutdown-button").click (function (){
	//Append loading spinner
	//$(".page-title").append('<div class="loading">Loading&#8230;</div>');

	//Load shutdown.php file which contains the shutdown command
	$.ajax({
		url: 'shutdown.php',
    beforeSend: function() {
        setTimeout("alert('Shutdown has been initiated.');", 1);
    },
		success: function (data) {
			//If success remove the spinner
			//$(".loading").remove();
		},
		error: function (xhr, status, error) {
			//If error, alert the error to the user
			if (xhr.status > 0) alert('got error: ' + status);
		}
	});

});
//When user clicks Stop Audio button
$(".stop-audio").click (function (){
  //console.log("stop");
	//Append loading spinner
	$(".page-title").append('<div class="loading">Loading&#8230;</div>');
	//Load file which contains the command
	$.ajax({
		url: 'start-stop-audio.php?what=stop',
		success: function (data) {
      // unpress the button
      $(".stop-audio").blur();
			//If success remove the spinner
			$(".loading").remove();
      $('#start-stop-audio-results').html(data);
		},
		error: function (xhr, status, error) {
			//If error, alert the error to the user
			if (xhr.status > 0) alert('got error: ' + status);
		}
	});

});
//When user clicks Start Audio button
$(".start-audio").click (function (){
  //console.log("start");
	//Append loading spinner
  $('#start-stop-audio-results').html("Audio Started.");
	//$(".page-title").append('<div class="loading">Loading&#8230;</div>');
	//Load file which contains the command
	$.ajax({
		url: 'start-stop-audio.php?what=start',
		success: function (data) {
      // unpress the button
      $(".start-audio").blur();
			//If success remove the spinner
			//$(".loading").remove();
      $('#start-stop-audio-results').html(data);
		},
		error: function (xhr, status, error) {
			//If error, alert the error to the user
			if (xhr.status > 0) alert('got error: ' + status);
		}
	});

});
//When user clicks Stop Video button
$(".stop-video").click (function (){
	//Append loading spinner
	$(".page-title").append('<div class="loading">Loading&#8230;</div>');
	//Load file which contains the command
	$.ajax({
		url: 'start-stop-video.php?what=stop',
		success: function (data) {
      // unpress the button
      $(".stop-video").blur();
			//If success remove the spinner
			$(".loading").remove();
      $('#start-stop-results').html(data);
		},
		error: function (xhr, status, error) {
			//If error, alert the error to the user
			if (xhr.status > 0) alert('got error: ' + status);
		}
	});

});

//When user clicks Stop Video button
$(".start-video").click (function (){
	//Append loading spinner
	$(".page-title").append('<div class="loading">Loading&#8230;</div>');
	//Load file which contains the command
	$.ajax({
		url: 'start-stop-video.php?what=start',
		success: function (data) {
      // unpress the button
      $(".start-video").blur();
			//If success remove the spinner
			$(".loading").remove();
      $('#start-stop-results').html(data);
		},
		error: function (xhr, status, error) {
			//If error, alert the error to the user
			if (xhr.status > 0) alert('got error: ' + status);
		}
	});
  // crazy as it seems, the shell script won't return.  So, by running it a second time, it forces the first time to return.
  // The second time doesn't hurt anything because the port is in use and a second server will not launch.
  $.ajax({
		url: 'start-stop-video.php?what=start',
		success: function (data) {
      // unpress the button
      $(".start-video").blur();
			//If success remove the spinner
			$(".loading").remove();
      $('#start-stop-results').html(data);
		},
		error: function (xhr, status, error) {
			//If error, alert the error to the user
			if (xhr.status > 0) alert('got error: ' + status);
		}
	});

});

function loadCurrentSettings(){
  var ssids = "";
  // scan for available wifi Networks and load the avail net combo box
  $.ajax({
    url: 'wifi-scan.php',
    success: function (data) {
      // parse the data to capture just the ids delimited by quotes
      // load combo box with results
      ssids = data.split("\"");
      select = document.getElementById( "ssid" );
      for (i = 0; i < ssids.length; i++){
              if (!ssids[i].includes("ESSID") && ssids[i] !== ""){
                option = document.createElement( 'option' );
                option.value = option.text = ssids[i];
                select.add( option );
              }
      }

      // read the current wifi config file and load the page fields and select combo box options
      $.ajax({
        url: 'wifi-loadcurrent.php',
        success: function (data) {
          // split the result and set the field values

          // find the ssid in the combo box and select it
          ssidselect = document.getElementById( "ssid" );
          for (i = 0; i < ssids.length; i++){
                  if (data.includes(ssids[i]) && ssids[i] !== ""){
                    ssidselect.value = ssids[i];
                  }
          }
          // find the psk and fill in the field
          var psk = data.split("\"");
          // find the entry with 'psk' and then take the next one.
          for (i = 0; i < psk.length; i++){
            //console.log(psk[i]);
                  if (psk[i].includes("psk=")){
                    //console.log("matches")
                    $("#psk").val(psk[i+1]);
                  }
          }

        },
        error: function (xhr, status, error) {
          //If error, alert the error to the user
          if (xhr.status > 0) alert('got error: ' + status);
        }
      });
    },
    error: function (xhr, status, error) {
      //If error, alert the error to the user
      if (xhr.status > 0) alert('got error: ' + status);
    }
  });

  // read the current dhcpcd.conf network settings and fill in the page fields for both
  // eth and wlan and check proper radio buttons

  $.ajax({
    url: 'dhcpcd-loadcurrent.php',
    success: function (data) {
      //console.log(data);
      // to make the interface use dhcp, remove the entry from this file.
      // otherwise, this file sets static IP

      /*
      hostname
      clientid
      persistent
      option rapid_commit
      option domain_name_servers, domain_name, domain_search, host_name
      option classless_static_routes
      option ntp_servers
      require dhcp_server_identifier
      slaac private
      nohook lookup-hostname

      interface eth0

      static ip_address=192.168.1.123/24
      static routers=192.168.1.253
      static domain_name_servers=8.8.8.8 8.8.4.4

      interface wlan0

      static ip_address=192.168.1.123/24
      static routers=192.168.1.253
      static domain_name_servers=8.8.8.8 8.8.4.4
      */

      // capture everything after lookup-hostname
      var netsettings = data.substring(data.indexOf("lookup-hostname")+15);
      //console.log(netsettings);
      var eth0Ip = "";
      var eth0Subnet = "";
      var eth0Gateway = "";

      var wlan0Ip = "";
      var wlan0Subnet = "";
      var wlan0Gateway = "";

      var eth0dns = "";
      var wlan0dns = "";

      var eth0section = "";
      var wlan0section = "";

      // Handle the file if both eth and wlan are present
      if( netsettings.includes("eth0") && netsettings.includes("wlan0")){
        console.log("both");

        // separate eth from wlan0
        eth0section = netsettings.substring(netsettings.indexOf("interface eth0"), netsettings.indexOf("interface wlan0"));
        console.log(eth0section);

        wlansection = netsettings.substring(netsettings.indexOf("interface wlan0"));
        console.log(wlansection);

        // parse eth0
        if (eth0section.includes("ip_address")){
          eth0Ip = eth0section.substring(eth0section.indexOf("interface eth0"));
          eth0Ip = eth0Ip.substring(eth0Ip.indexOf("ip_address=")+11, eth0Ip.indexOf("/"));
        };

        if (eth0section.includes("/")){
          eth0Subnet = eth0section.substring(eth0section.indexOf("interface eth0"));
          eth0Subnet = eth0Subnet.substring(eth0Subnet.indexOf("/")+1, eth0Subnet.indexOf("\n",eth0Subnet.indexOf("/")+1));
        };

        if (eth0section.includes("routers")){
          eth0Gateway = eth0section.substring(eth0section.indexOf("interface eth0"));
          eth0Gateway = eth0Gateway.substring(eth0Gateway.indexOf("routers=")+8, eth0Gateway.indexOf("\n",eth0Gateway.indexOf("routers=")+8));
        };

        //load fields with data
        $("#eth0Ip").val(eth0Ip);
        $("#eth0Subnet").val(eth0Subnet);
        $("#eth0Gateway").val(eth0Gateway);
        //select static ip radio button
        if (eth0Ip || eth0Subnet || eth0Gateway){
          document.getElementById("ethstaticradio").checked = true;
        } else {
          document.getElementById("ethdhcpradio").checked = true;
        };

        if (eth0section.includes("domain_name_servers")){
          eth0dns = eth0section.substring(eth0section.indexOf("interface eth0"));
          eth0dns = eth0section.substring(eth0section.indexOf("domain_name_servers=",eth0section.indexOf("interface eth0"))+20,eth0section.indexOf("\n",eth0section.indexOf("domain_name_servers=",eth0section.indexOf("interface eth0"))+20));
          eth0dns = eth0dns.split(" ");
        };

        //load fields with data
        $("#eth0DNS1").val(eth0dns[0]);
        $("#eth0DNS2").val(eth0dns[1]);
        //select static ip radio button
        if (eth0dns[0] || eth0dns[1]){
          document.getElementById("dnsstaticradio").checked = true;
        } else {
          document.getElementById("dnsdhcpradio").checked = true;
        };

        // parse wlan0
        if (wlansection.includes("ip_address")){
          wlan0Ip = wlansection.substring(wlansection.indexOf("interface wlan0"));
          wlan0Ip = wlan0Ip.substring(wlan0Ip.indexOf("ip_address=")+11, wlan0Ip.indexOf("/"));
        };

        if (wlansection.includes("/")){
          wlan0Subnet = wlansection.substring(wlansection.indexOf("interface wlan0"));
          wlan0Subnet = wlan0Subnet.substring(wlan0Subnet.indexOf("/")+1, wlan0Subnet.indexOf("\n",wlan0Subnet.indexOf("/")+1));
        };

        if (wlansection.includes("routers")){
          wlan0Gateway = wlansection.substring(wlansection.indexOf("interface wlan0"));
          wlan0Gateway = wlan0Gateway.substring(wlan0Gateway.indexOf("routers=")+8, wlan0Gateway.indexOf("\n",wlan0Gateway.indexOf("routers=")+8));
        };

        //load fields with data
        $("#wlan0Ip").val(wlan0Ip);
        $("#wlan0Subnet").val(wlan0Subnet);
        $("#wlan0Gateway").val(wlan0Gateway);
        //select static ip radio button
        if (wlan0Ip || wlan0Subnet || wlan0Gateway){
          document.getElementById("wlanstaticradio").checked = true;
        } else {
          document.getElementById("wlandhcpradio").checked = true;
        };

        if (wlansection.includes("domain_name_servers")){
          wlan0dns = wlansection.substring(wlansection.indexOf("interface wlan0"));
          wlan0dns = wlansection.substring(wlansection.indexOf("domain_name_servers=",wlansection.indexOf("interface wlan0"))+20,wlansection.indexOf("\n",wlansection.indexOf("domain_name_servers=",wlansection.indexOf("interface wlan0"))+20));
          wlan0dns = wlan0dns.split(" ");
        };

        //load fields with data
        $("#wlan0DNS1").val(wlan0dns[0]);
        $("#wlan0DNS2").val(wlan0dns[1]);
        //select static ip radio button
        if (wlan0dns[0] || wlan0dns[1]){
          document.getElementById("wlandnsstaticradio").checked = true;
        } else {
          document.getElementById("wlandnsdhcpradio").checked = true;
        };

      } else if (netsettings.includes("eth0")){
        console.log("only eth0");

        if (netsettings.includes("ip_address")){
          eth0Ip = netsettings.substring(netsettings.indexOf("interface eth0"));
          eth0Ip = eth0Ip.substring(eth0Ip.indexOf("ip_address=")+11, eth0Ip.indexOf("/"));
        };

        if (netsettings.includes("/")){
          eth0Subnet = netsettings.substring(netsettings.indexOf("interface eth0"));
          eth0Subnet = eth0Subnet.substring(eth0Subnet.indexOf("/")+1, eth0Subnet.indexOf("\n",eth0Subnet.indexOf("/")+1));
        };

        if (netsettings.includes("routers")){
          eth0Gateway = netsettings.substring(netsettings.indexOf("interface eth0"));
          eth0Gateway = eth0Gateway.substring(eth0Gateway.indexOf("routers=")+8, eth0Gateway.indexOf("\n",eth0Gateway.indexOf("routers=")+8));
        };

        //load fields with data
        $("#eth0Ip").val(eth0Ip);
        $("#eth0Subnet").val(eth0Subnet);
        $("#eth0Gateway").val(eth0Gateway);
        //select static ip radio button
        if (eth0Ip || eth0Subnet || eth0Gateway){
          document.getElementById("ethstaticradio").checked = true;
        } else {
          document.getElementById("ethdhcpradio").checked = true;
        }

        //set fields to blank
        $("#wlan0Ip").val("");
        $("#wlan0Subnet").val("");
        $("#wlan0Gateway").val("");
        //set dhcp ip radio button
        document.getElementById("wlandhcpradio").checked = true;

        if (netsettings.includes("domain_name_servers")){
          eth0dns = netsettings.substring(netsettings.indexOf("interface eth0"));
          eth0dns = netsettings.substring(netsettings.indexOf("domain_name_servers=",netsettings.indexOf("interface eth0"))+20,netsettings.indexOf("\n",netsettings.indexOf("domain_name_servers=",netsettings.indexOf("interface eth0"))+20));
          eth0dns = eth0dns.split(" ");
        };

        //load fields with data
        $("#eth0DNS1").val(eth0dns[0]);
        $("#eth0DNS2").val(eth0dns[1]);
        //select static ip radio button
        if (eth0dns[0] || eth0dns[1]){
          document.getElementById("dnsstaticradio").checked = true;
        } else {
          document.getElementById("dnsdhcpradio").checked = true;
        };

        //set fields to blank
        $("#wlan0DNS1").val("");
        $("#wlan0DNS2").val("");
        //set dhcp ip radio button
        document.getElementById("wlandnsdhcpradio").checked = true;

      } else if (netsettings.includes("wlan0")){
        console.log("only wlan0");

        if (netsettings.includes("ip_address")){
          wlan0Ip = netsettings.substring(netsettings.indexOf("interface wlan0"));
          wlan0Ip = wlan0Ip.substring(wlan0Ip.indexOf("ip_address=")+11, wlan0Ip.indexOf("/"));
        };

        if (netsettings.includes("/")){
          wlan0Subnet = netsettings.substring(netsettings.indexOf("interface wlan0"));
          wlan0Subnet = wlan0Subnet.substring(wlan0Subnet.indexOf("/")+1, wlan0Subnet.indexOf("\n",wlan0Subnet.indexOf("/")+1));
        };

        if (netsettings.includes("routers")){
          wlan0Gateway = netsettings.substring(netsettings.indexOf("interface wlan0"));
          wlan0Gateway = wlan0Gateway.substring(wlan0Gateway.indexOf("routers=")+8, wlan0Gateway.indexOf("\n",wlan0Gateway.indexOf("routers=")+8));
        };

        //set eth0 fields to blank
        $("#eth0Ip").val("");
        $("#eth0Subnet").val("");
        $("#eth0Gateway").val("");
        //set dhcp ip radio button
        document.getElementById("ethdhcpradio").checked = true;

        //load fields with data
        $("#wlan0Ip").val(wlan0Ip);
        $("#wlan0Subnet").val(wlan0Subnet);
        $("#wlan0Gateway").val(wlan0Gateway);
        //select static ip radio button
        if (wlan0Ip || wlan0Subnet || wlan0Gateway){
          document.getElementById("wlanstaticradio").checked = true;
        } else {
          document.getElementById("wlandhcpradio").checked = true;
        };

        if (netsettings.includes("domain_name_servers")){
          wlan0dns = netsettings.substring(netsettings.indexOf("interface wlan0"));
          wlan0dns = netsettings.substring(netsettings.indexOf("domain_name_servers=",netsettings.indexOf("interface wlan0"))+20,netsettings.indexOf("\n",netsettings.indexOf("domain_name_servers=",netsettings.indexOf("interface wlan0"))+20));
          wlan0dns = wlan0dns.split(" ");
        };

        //set fields to blank
        $("#eth0DNS1").val("");
        $("#eth0DNS2").val("");
        //set dhcp ip radio button
        document.getElementById("dnsdhcpradio").checked = true;

        //load fields with data
        $("#wlan0DNS1").val(wlan0dns[0]);
        $("#wlan0DNS2").val(wlan0dns[1]);
        //select static ip radio button
        if (wlan0dns[0] || wlan0dns[1]){
          document.getElementById("wlandnsstaticradio").checked = true;
        } else {
          document.getElementById("wlandnsdhcpradio").checked = true;
        };

      } else {
        console.log("contains none.");

        //set eth0 fields to blank
        $("#eth0Ip").val("");
        $("#eth0Subnet").val("");
        $("#eth0Gateway").val("");
        //set dhcp ip radio button
        document.getElementById("ethdhcpradio").checked = true;

        //set fields to blank
        $("#wlan0Ip").val("");
        $("#wlan0Subnet").val("");
        $("#wlan0Gateway").val("");
        //set dhcp ip radio button
        document.getElementById("wlandhcpradio").checked = true;

        //set fields to blank
        $("#eth0DNS1").val("");
        $("#eth0DNS2").val("");
        //set dhcp ip radio button
        document.getElementById("dnsdhcpradio").checked = true;

        //set fields to blank
        $("#wlan0DNS1").val("");
        $("#wlan0DNS2").val("");
        //set dhcp ip radio button
        document.getElementById("wlandnsdhcpradio").checked = true;

      };

    },
    error: function (xhr, status, error) {
      //If error, alert the error to the user
      if (xhr.status > 0) alert('got error: ' + status);
    }
  });

}

  //When user clicks Save on wifi network settings
$(".net-settings-save").click (function (){
  // save all ip settings to dhcpcd.config

  var eth0header = `
  interface eth0
   `;
  var eth0ipblock = `static ip_address=`+$("#eth0Ip").val()+`/`+$("#eth0Subnet").val()+`
  static routers=`+$("#eth0Gateway").val()+`
   `;
  var eth0dnsblock = `static domain_name_servers=`+$("#eth0DNS1").val()+` `+$("#eth0DNS2").val()+`
   `;
  var wlanheader = `
  interface wlan0
   `;

  var wlanipblock = `static ip_address=`+$("#wlan0Ip").val()+`/`+$("#wlan0Subnet").val()+`
  static routers=`+$("#wlan0Gateway").val()+`
   `;
  var wlandnsblock = `static domain_name_servers=`+$("#wlan0DNS1").val()+` `+$("#wlan0DNS2").val()+`
   `;
  var addressblock = "";

  if(document.getElementById('dnsstaticradio').checked || document.getElementById('ethstaticradio').checked){
    addressblock += eth0header;
    if(document.getElementById('ethstaticradio').checked){
      addressblock += eth0ipblock;
    }
    if(document.getElementById('dnsstaticradio').checked){
      addressblock += eth0dnsblock;
    }
  }



  if(document.getElementById('wlandnsstaticradio').checked || document.getElementById('wlanstaticradio').checked){
    addressblock += wlanheader;
    if(document.getElementById('wlanstaticradio').checked){
      addressblock += wlanipblock;
    }
    if(document.getElementById('wlandnsstaticradio').checked){
      addressblock += wlandnsblock;
    }
  }
console.log(addressblock);
  $.ajax({
    type: "POST",
    data: {
      "addressblock": addressblock
    },
    url: 'dhcpcd-writefile.php',
    success: function (data) {
      //console.log(data);
      //If success remove the spinner
      $(".loading").remove();
    //  location.reload();
    },
    error: function (xhr, status, error) {
      //If error, alert the error to the user
      if (xhr.status > 0) alert('got error: ' + status);
    }
  });

  // restart networking
  $.ajax({
    url: 'restart-networking.php',
    success: function (data) {
      //console.log(data);
      //If success remove the spinner
      $(".loading").remove();
      loadCurrentSettings();
    //  location.reload();
    },
    error: function (xhr, status, error) {
      //If error, alert the error to the user
      if (xhr.status > 0) alert('got error: ' + status);
    }
  });

});
function sleep(miliseconds) {
   var currentTime = new Date().getTime();

   while (currentTime + miliseconds >= new Date().getTime()) {
   }
}
//When user clicks Save on wifi connection settings
$(".wifi-save").click (function (){
	//Append loading spinner
  var ssid = $('#ssid').val();
  var psk = $('#psk').val();
  var mgt = $('#mgt').val();
	$(".page-title").append('<div class="loading">Loading&#8230;</div>');

	$.ajax({
    type: "POST",
    data: {
      "ssid": ssid,
      "psk": psk,
      "mgt": mgt
    },
		url: 'wifi-writefile.php',
		success: function (data) {
      //console.log(data);
			//If success remove the spinner
			$(".loading").remove();
    //  location.reload();
		},
		error: function (xhr, status, error) {
			//If error, alert the error to the user
			if (xhr.status > 0) alert('got error: ' + status);
		}
	});

  $.ajax({
    url: 'restart-networking.php',
    success: function (data) {
      //console.log(data);
      //If success remove the spinner
      $(".loading").remove();
      loadCurrentSettings();
    //  location.reload();
    },
    error: function (xhr, status, error) {
      //If error, alert the error to the user
      if (xhr.status > 0) alert('got error: ' + status);
    }
  });
});

function getAudioIP(){
  $.ajax({
    url: 'audio-ip.php',
    success: function (data) {
      //console.log(data);
      var ip=data.substring(data.indexOf("myconfig.audmasterIP = '")+24, data.indexOf("'",data.indexOf("myconfig.audmasterIP = '")+25));
      //console.log(ip);
      $("#audioAddress").html(ip);

    },
    error: function (xhr, status, error) {
      //If error, alert the error to the user
      if (xhr.status > 0) alert('got error: ' + status);
    }
  });
}

function videoPageLoad(){
  var formatted = "Error Result";
  $(".page-title").append('<div class="loading">Loading&#8230;</div>');
  getAudioIP();
  $.ajax({
    url: 'audio-ip.php',
    success: function (data) {
      //console.log(data);
      var ip=data.substring(data.indexOf("myconfig.audmasterIP = '")+24, data.indexOf("'",data.indexOf("myconfig.audmasterIP = '")+25));
      var url="audio-ping.php?ip="+ip;
      //console.log(url);
      $.ajax({
        url: url,
        success: function (data) {
          //console.log(data);
          $(".loading").remove();
          var splitData = data.split("---");
          if(splitData.length > 2){
            formatted = splitData[0]+"<br><br>"+splitData[1]+"<br><br>"+splitData[2];
          } else {
            formatted = data;
          }
          $("#ping-results").html(formatted);
        },
        error: function (xhr, status, error) {
          //If error, alert the error to the user
          if (xhr.status > 0) alert('got error: ' + status);
        }
      });
    },
    error: function (xhr, status, error) {
      //If error, alert the error to the user
      if (xhr.status > 0) alert('got error: ' + status);
    }
  });

}

function loadAudioPage(){
  $(".page-title").append('<div class="loading">Loading&#8230;</div>');
  // read the value from the file /var/www/html/offset.cfg
  $.ajax({
    url: 'audio-offset.php',
    success: function (data) {
      //console.log(data);
      // put it in the html field
      $(".loading").remove();
      $('#audio-offset').val(data);
    },
    error: function (xhr, status, error) {
      //If error, alert the error to the user
      if (xhr.status > 0) alert('got error: ' + status);
    }
  });

  // read the value of the audio level from amixer
  /*
  Simple mixer control 'PCM',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback -10239 - 400
  Mono: Playback -1500 [82%] [-15.00dB] [on]
 */
 $(".page-title").append('<div class="loading">Loading&#8230;</div>');
 // read the value from the file /var/www/html/offset.cfg
 $.ajax({
   url: 'audio-volume.php',
   success: function (data) {
     var level = data.substring(data.indexOf("%")-4);
     level = level.substring(level.indexOf("[")+1, level.indexOf("%"));
    // console.log(level);
     // put it in the html field
     $(".loading").remove();
     var $range = $(".js-range-slider");
      $range.ionRangeSlider({
          type: "single",
          min: 0,
          max: 100,
          from: level,
          onFinish: function (data) {
             //var min = data.min;     // get the minimum value from the range slider
             var from = data.from;   // get the maximum value from the range slider
             // do something with this information
            // console.log(from);
             setAudioLevel(from);
          }
      });
   },
   error: function (xhr, status, error) {
     //If error, alert the error to the user
     if (xhr.status > 0) alert('got error: ' + status);
   }
 });
}

$(".set-audio-offset").click (function (){
  // read the value of the fields
  $(".page-title").append('<div class="loading">Loading&#8230;</div>');
  var offset = $('#audio-offset').val();

  // save the new value
  $.ajax({
    url: 'audio-set-offset.php',
    type: "GET",
    data: {
      offset: offset
    },
    success: function (data) {
      //console.log(data);
      $(".loading").remove();
    },
    error: function (xhr, status, error) {
      //If error, alert the error to the user
      if (xhr.status > 0) alert('got error: ' + status);
    }
  });

});

function setAudioLevel(level){
  // set the amixer volumn based on position of irs-bar width style on click or change
  // amixer sset 'PCM' 50%
  // then call loadAudioPage() to show the new value.
  $.ajax({
    url: 'audio-set-level.php',
    type: "GET",
    data: {
      level: level
    },
    success: function (data) {
      //console.log(data);
      $(".loading").remove();
      loadAudioPage();
    },
    error: function (xhr, status, error) {
      //If error, alert the error to the user
      if (xhr.status > 0) alert('got error: ' + status);
    }
  });
}
