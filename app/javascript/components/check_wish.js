
const check_wish = () => {
  const wishes = document.querySelectorAll('.reco-modal-wish')
  console.log(wishes)
  wishes.forEach((wish) => {
    // wish.addEventListener('click', () => {
    //   console.log(wish.innerText)
    //   console.log(wish)
    // })
  });
};


export { check_wish }
