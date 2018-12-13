import Chart from 'chart.js';

const initLine = () => {
  console.log('hello my dear');
  const cty = document.getElementById('bottle_lines');
  const wine_line_values = cty.dataset.line.split(',');
  console.log(wine_line_values);

  const myLineChart = new Chart(cty, {
    type: 'bar',
    data: {
      labels: ['à boire', 'à garder', 'trop vieux'],
      datasets: [{
        data: wine_line_values,
        borderColor: '#FF006F',
        backgroundColor:'#FF006F'
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


