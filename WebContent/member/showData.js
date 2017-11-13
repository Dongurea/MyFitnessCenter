    var dataForDonut=new Array;
	var dataForLineFat=new Array;
	var dataForLineMuscle=new Array;
    var dataForRadarReal=new Array;
    var dataForRadarSche=new Array;
    var dataForBar=new Array;
    var labelForDate=new Array;

	var randomScalingFactor = function() {
        return Math.round(Math.random() * 100);
    };

    var config = {
        type: 'doughnut',
        data: {
            datasets: [{
                data: dataForDonut,
                backgroundColor: [
                	"#CCFF00",
                	"#2d2d30"
                ],
                label: 'Dataset 1'
            }],
            labels: [
                "수행",
                "미수행"
            ]
        },
        options: {
            responsive: true,
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: '스케줄 시행률'
            },
            animation: {
                animateScale: true,
                animateRotate: true
            }
        }
    };
    var color = Chart.helpers.color;
    var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    function makeCharts() {
        var comp_donut = document.getElementById("comp-donut").getContext("2d");
        window.myDoughnut = new Chart(comp_donut, config);
        var weight_bar = document.getElementById("weight-bar").getContext("2d");
        window.myBar = new Chart(weight_bar, configForBar);
        var workout_part_rader = document.getElementById("workout-part-rader").getContext("2d");
        window.myRadar = new Chart( workout_part_rader, configForRadar);
        var fat_muscle_line = document.getElementById("fat-muscle-line").getContext("2d");
        window.myLine = new Chart(fat_muscle_line, configForLine);
    }
    		var configForBar={
    	            type: 'bar',
    	            data: {
    	                labels: labelForDate,
    	                datasets: [{
    	                    label: '몸무게',
    	                    backgroundColor: color("#CCFF00").alpha(0.5).rgbString(),
    	                    borderColor: "#CCFF00",
    	                    borderWidth: 1,
    	                    data: dataForBar
    	                }]

    	            },
    	            options: {
    	                responsive: true,
    	                legend: {
    	                    position: 'top',
    	                },
    	                title: {
    	                    display: true,
    	                    text: '몸무게 변화'
    	                }
    	            }
    	        };
            var barChartData;
            var randomScalingFactor = function() {
                return Math.round(Math.random() * 100);
            };
            var configForRadar = {
                type: 'radar',
                data: {
                    labels: ["유산소", "복합운동" , "무산소"],
                    datasets: [{
                        label: "스케줄 목표 운동파트",
                        backgroundColor: color("#CCFF00").alpha(0.2).rgbString(),
                        borderColor: "#CCFF00",
                        pointBackgroundColor: "#CCFF00",
                        data: dataForRadarSche
                    }, {
                        label: "실제 수행한 운동파트",
                        backgroundColor: color("#2d2d30").alpha(0.2).rgbString(),
                        borderColor: "#2d2d30",
                        pointBackgroundColor: "#2d2d30",
                        data: dataForRadarReal
                    },]
                },
                options: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: '스케줄별 운동부위와 실제실행 운동부위'
                    },
                    scale: {
                      ticks: {
                        beginAtZero: true
                      }
                    }
                }
            };
            
            
            var configForLine = {
                type: 'line',
                data: {
                    labels: labelForDate,
                    datasets: [{
                        label: "지방량",
                        backgroundColor: "#CCFF00",
                        borderColor: "#CCFF00",
                        data: dataForLineFat,
                        fill: false,
                    }, {
                        label: "근육량",
                        fill: false,
                        backgroundColor: "#2d2d30",
                        borderColor: "#2d2d30",
                        data: dataForLineMuscle,
                    }]
                },
                options: {
                    responsive: true,
                    title:{
                        display:true,
                        text:'지방량과 근육량의 변화'
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Month'
                            }
                        }],
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Value'
                            }
                        }]
                    }
                }
            };