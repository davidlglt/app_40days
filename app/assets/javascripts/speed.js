PubSub.subscribe('setPlaySpeed', function(msg, speed){
  setPlaySpeed(speed);
})

function setPlaySpeed(speed) {
  wistiaEmbed.playbackRate(speed);
}
