import $ from 'jquery';

function alert(){
  const alert_info = document.getElementById('alert-info');
  const alert_warning = document.getElementById('alert-info');
  $(".custom-alert" ).delay(2500).fadeOut(1000);
}

export { alert };
