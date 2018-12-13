const slide = () => {
  const slide = document.getElementById('price');
  const target = document.getElementById('target');
  console.log(slide.value);
  if (slide) {
    target.innerText = slide.value + ' €';
    console.log(target);
    slide.oninput = function() {
        target.innerText = this.value + ' €';
    };
  };
};

export { slide }
