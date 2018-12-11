const initNavbar = () => {
  const btn = document.getElementById('logo');
  const navbar = document.querySelector('.navbar');

  btn.addEventListener('click', () => {
    navbar.classList.toggle('open');
  });
};

export { initNavbar };
