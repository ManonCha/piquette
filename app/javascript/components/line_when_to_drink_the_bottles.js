import Chart from 'chart.js';

const initLine = () => {
  console.log('hello my dear');
  const cty = document.getElementById('bottle_lines');
  const wine_line_values = cty.dataset.line.split(',');

  var myLineChart = new Chart(cty, {
    type: 'line',
    data: {
      datasets: [{
        showLine: false,
        data:wine_line_values // disable for a single dataset
      }]
    },
  });
}

export { initLine };


