const blur = () => {
  const blur = document.getElementById('blur');
  const btn = document.querySelector('.menu-open-button');
  const body = document.querySelector('body');
  const html = document.querySelector('html');

  btn.addEventListener('click', () => {
    blur.classList.toggle('blur-active');
    body.classList.toggle('body-fixe');
    html.classList.toggle('body-fixe');
    blur.ontouchmove = function(event){
      event.preventDefault();
    }
  });
};


export { blur }
