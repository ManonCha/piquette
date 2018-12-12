import Chart from 'chart.js';

const initLine = () => {
  console.log('hello my dear');
  const cty = document.getElementById('bottle_lines');
  const wine_line_values = cty.dataset.line.split(',');

  const myLineChart = new Chart(cty, {
    type: 'line',
    data: {
      labels: ['', '', ''],
      datasets: [{
        data: wine_line_values,
        borderColor: 'rgba(105,25,255)',
        backgroundColor:'rgba(0,0,0)'
      }]
    },
    options: {
      legend: {
        display: false,
      },
      scales: {
         xAxes: [{
            gridLines: {
               display: false
            }
         }],
         yAxes: [{
            gridLines: {
               display: false
            }
         }]
      }
    }
  });
}

export { initLine };


