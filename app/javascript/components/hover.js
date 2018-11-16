import $ from 'jquery';

function hover(){
  const home = document.getElementById('home');

  if (home) {
    $(document).ready(function() {
     $('[data-toggle="popover"]').popover({
      placement: 'top',
      trigger: 'hover'
    });
   });
  }
}

export { hover };
