import Chart from 'chart.js'

const initHorizontalBarChart = () => {
  console.log('bonjour monsieur');
  const cta = document.getElementById('regions_wine');
  const wine_regions = cta.dataset.bar.split(',');

  var myBarChart = new Chart(cta, {
    type: 'horizontalBar',
    data: {
      labels: ['jhqsjkdhjkqs', '', ''],
      datasets: [{
        data: wine_regions,
        backgroundColor: [
            'rgba(250, 0, 134)',
            'rgba(54, 162, 235)',
            'rgba(255, 206, 86)',
            'rgba(255,255,255)'
        ]
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
