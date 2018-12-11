const displayForm = () => {
  const buy = document.getElementById('buy');
  const search = document.getElementById('search');
  const form_search = document.querySelector('.search');
  const form_buy = document.querySelector('.buy');

  buy.addEventListener('click', () => {
    form_buy.classList.remove('disabled');
    form_search.classList.add('disabled');
  });

  search.addEventListener('click', () => {
    form_search.classList.remove('disabled');
    form_buy.classList.add('disabled');
  });
};


export { displayForm }
