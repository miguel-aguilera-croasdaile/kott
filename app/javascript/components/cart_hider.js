import $ from 'jquery';

function cartHider(){

  const cartNotification = document.getElementById('cart-notification')
  const dismissCartNotification = document.getElementById('dismissCartNotification');

  if (dismissCartNotification) {
    $(cartNotification).delay(200).animate({ opacity: 1 }, 200)
    dismissCartNotification.addEventListener("click", function(){
      $(cartNotification).fadeOut();
    });
  }
}

export { cartHider };
