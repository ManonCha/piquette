import Chart from 'chart.js'

const initHorizontalBarChart = () => {
  const cta = document.getElementById('regions_wine');
  const wine_regions = cta.dataset.bar.split(',');
  const labels = JSON.parse(cta.dataset.labels);

  var myBarChart = new Chart(cta, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [{
        data: wine_regions,
        backgroundColor: [
            '#FF006F',
            '#FF006F',
            '#FF006F',
            '#FF006F'
        ],

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

export { initHorizontalBarChart };
