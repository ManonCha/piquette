const photo = () => {
  const photoBtns = document.querySelectorAll('.display-photo')

  photoBtns.forEach((btn) => {

    // photoField.classList.toggle('hidden-photo')
    btn.addEventListener('click', event => {
      const modal = event.currentTarget.parentElement

      const divPhoto = modal.querySelector('.bottle-modal-photo')
      const photo = modal.querySelector('.bottle-modal-photo img')
      const title = modal.querySelector('.modal-title')
      title.classList.toggle('large-title')
      photo.classList.toggle('hidden-photo')
      divPhoto.classList.toggle('hidden-photo')
      btn.classList.toggle('photo-rotate')
    })
  })
};

export { photo }
