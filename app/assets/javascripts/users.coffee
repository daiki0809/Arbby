# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.gauge = (percentage) -> 
    ctx = document.getElementById("myChart").getContext('2d')

    myChart = new Chart(ctx, {
        type: 'horizontalBar',
        data: {
            labels: [""],
            datasets: [{
                label: '次のレベルまで',
                data: [percentage],
                backgroundColor: [
                    'rgba(0, 30, 200, 0.2)'
                ],
                borderColor: [
                    '#88BCED'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                xAxes: [{
                    ticks: {
                        beginAtZero:true
                        max: 100
                    }
                }]
            },
            events: ['mouseout', 'touchstart', 'touchmove']
        }
    });