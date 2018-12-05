const hideForm = () => {
  window.addEventListener('scroll', () => {
    const forms = document.querySelectorAll(".form-container");
    forms.forEach((form) => {
      const bounding = form.getBoundingClientRect();
      if (
        bounding.top >= 0 &&
        bounding.left >= 0 &&
        bounding.right <= (window.innerWidth || document.documentElement.clientWidth) &&
        bounding.bottom <= (window.innerHeight || document.documentElement.clientHeight)
      ) {
        form.classList.add('highlight');
      } else {
        form.classList.remove('highlight');
      }
    });

  })
};

export { hideForm }

