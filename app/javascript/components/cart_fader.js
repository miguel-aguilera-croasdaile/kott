import $ from 'jquery';

function cartFader(){

  const cartNotification = document.getElementById('cart-notification')
  const dismissCartNotification = document.getElementById('dismissCartNotification');

  if (dismissCartNotification) {
    cartNotification.addEventListener("click", function(){
      console.log("Success")
    });
  }
}

export { cartFader };
