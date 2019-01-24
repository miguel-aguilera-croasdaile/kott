import $ from 'jquery';

function alert(){
  const alert_info = document.getElementById('alert-info');
  const alert_warning = document.getElementById('alert-info');
  $(".custom-alert" ).delay(2000).fadeOut(750);
}

export { alert };
