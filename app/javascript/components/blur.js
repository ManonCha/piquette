const blur = () => {
  const blur = document.getElementById('blur');
  const btn = document.querySelector('.menu-open-button');
  const body = document.querySelector('body');

  btn.addEventListener('click', () => {
    blur.classList.toggle('blur-active');
    body.classList.toggle('body-fixe');
  });
};


export { blur }
