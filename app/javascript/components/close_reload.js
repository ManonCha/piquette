const close_reload = () => {

  const closes = document.querySelectorAll('.modal-close');

  closes.forEach((close) => {
    close.addEventListener('click', () => {
      location.reload();
    });
  })

};


export { close_reload }
