
const initDognut = () => {

  let redSvg = document.querySelector('.wine-fill-red');
  const ctfd = document.querySelector('.javascripthelper');
  console.log(ctfd.dataset);
  const wine1 = ctfd.dataset.wine1.split(',');
  const RedwinePercentage = parseInt(wine1[0]) / parseInt(wine1[1]);
  redSvg.setAttribute('y', (1 - RedwinePercentage) * 280 + 220);

  let whiteSvg = document.querySelector('.wine-fill-white');
  const ctfe = document.querySelector('.javascripthelper');
  const wine2 = ctfe.dataset.wine2.split(',');
  const WhitewinePercentage = parseInt(wine2[0]) / parseInt(wine2[1]);
  whiteSvg.setAttribute('y', (1 - WhitewinePercentage) * 280 + 220);


  let RoseSvg = document.querySelector('.wine-fill-rose');
  const ctfr = document.querySelector('.javascripthelper');

  const wine3 = ctfr.dataset.wine3.split(',');
  console.log(wine3)
  const RosewinePercentage = parseInt(wine3[0]) / parseInt(wine3[1]);
  RoseSvg.setAttribute('y', (1 - RosewinePercentage) * 280 + 220);

}


export { initDognut };


