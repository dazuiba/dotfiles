var MY_PROXY = "SOCKS5 win-work:7777"
var LIST = ["googlecode","jobsdigg.com","songza.com","ytimg.com","fbcdn.net","twimg.com","img.ly","jayfields.com","mplayerhq.hu","youtube.com","bullogger.com","google.com.hk","google.com","audioscrobbler.com","twitter.com","facebook.com","pandora.com","blogspot.com","dropbox.com"]

function contains(list,host){
  for(var i = 0; i < list.length; i++) {
    if(shExpMatch(host, list[i])||shExpMatch(host, "*."+list[i])){
      return true;
    }
  }
  return false
}

function FindProxyForURL(url,host){
			if (contains(LIST, host))
          return MY_PROXY
      else
          return "DIRECT;"+MY_PROXY
}
