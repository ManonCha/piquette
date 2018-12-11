const search = () => {
  const searchBtn = document.getElementById('search-btn')
  const searchField = document.querySelector('.search-bar')

  // searchField.classList.toggle('hidden-search')

  searchBtn.addEventListener('click', () => {
    searchField.classList.toggle('hidden-search')
  });
};

export { search }
