// JS Code
var ctx = document.getElementById('myChart').getContext('2d');
var myChart;

function updateChart() {
  fetch('/ranking/get_json')
    .then(response => response.json())
    .then(data => {
      const dataset = data.map((item, index) => ({
        
        label: item.id_employee,
        data: [item.count],
        backgroundColor: getBackgroundColor(index),
        borderColor: getBorderColor(index),
        borderWidth: 1
      }));
      
      // Memperbarui dataset chart
      myChart.data.datasets = dataset;
      myChart.data.labels = ["Karyawan terbaik"];
      // Memperbarui chart
      myChart.update();
    })
    .catch(error => {
      console.error('Error:', error);
    });
}

// Mendapatkan warna latar belakang berdasarkan indeks
function getBackgroundColor(index) {
  const colors = ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'];
  return colors[index % colors.length];
}

// Mendapatkan warna border berdasarkan indeks
function getBorderColor(index) {
  const colors = ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)'];
  return colors[index % colors.length];
}

// Memuat data pertama kali
updateChart();

// Mendefinisikan chart
myChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: [],
    datasets: []
  },
  options: {
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true
        }
      }]
    }
  }
});
