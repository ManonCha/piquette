

const autoscroll = () => {

  const ones = document.querySelectorAll('#ans-one')
  ones.forEach((one) => {
    one.addEventListener('click', () => {
      document.querySelector(".two").scrollIntoView({ behavior: 'smooth' });
    })
  });

  const twos = document.querySelectorAll('#ans-two')
  twos.forEach((two) => {
    two.addEventListener('click', () => {
      document.querySelector(".three").scrollIntoView({ behavior: 'smooth' });
    })
  });

  const threes = document.querySelectorAll('#ans-three')
  threes.forEach((three) => {
    three.addEventListener('click', () => {
      document.querySelector(".four").scrollIntoView({ behavior: 'smooth' });
    })
  });

  const fours = document.querySelectorAll('#ans-four')
  fours.forEach((four) => {
    four.addEventListener('click', () => {
      document.querySelector(".five").scrollIntoView({ behavior: 'smooth' });
    })
  });

};


export { autoscroll }
