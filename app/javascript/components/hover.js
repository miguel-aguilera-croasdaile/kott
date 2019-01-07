import $ from 'jquery';

function hover(){
  const product_container = document.getElementById('product-container');

  if (product_container) {
    $(function() {
      $(".product-card").hover(function() {
        $(this).find(".product-hover-card").animate({ opacity: "toggle"}, {duration: 200 })
      });
    });
  }
}

export { hover };
