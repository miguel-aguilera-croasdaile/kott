import $ from 'jquery';

function hover(){
  const home = document.getElementById('home');

  if (home) {
    $(function() {
      $(".product-card").hover(function() {
        $(this).find(".product-hover-card").animate({ opacity: "toggle"}, {duration: 200 })
      });
    });
  }
}

export { hover };