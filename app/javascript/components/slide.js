const slide = () => {
  const slide = document.getElementById('price');
  const target = document.getElementById('target');

  slide.addEventListener('change', (event) => {
    // console.log(event.target.value);
    target.innerText = event.target.value;
  });
};

export { slide }
