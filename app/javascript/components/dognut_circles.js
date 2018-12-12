import Chart from 'chart.js'

const initDognut = () => {
  console.log('hell54564');
  const ctx = document.getElementById('bottle_charts');
  const wine = ctx.dataset.wine.split(',');

  var myDoughnutChart = new Chart(ctx, {
    type: 'doughnut',
    options: {
      cutoutPercentage: 55,
      legend: {
        display: true
      }
    },
    data: {
      datasets: [{
        data: wine,
        backgroundColor: [
          '#B13548',
          'rgb(252, 238, 190)',
          'rgba(255, 206, 86)'
        ],
        borderColor: 'rgba(255,255,255)',
        borderWidth: 0,
      }]
    }
  });
}

export { initDognut };


