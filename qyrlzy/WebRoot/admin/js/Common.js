// Float数据四舍五入到2位小数; 
function to2bits(flt) { 
	if(parseFloat(flt) == flt) 
		return Math.round(flt * 100) / 100; 
	else 
		return 0; 
}  

//获取风险图信息
function getDisasterOptions(){
   var options = {
       chart: {
			renderTo: '',
			defaultSeriesType: 'column',
	        zoomType: 'xy',   //X、Y轴均可放大
	        borderWidth:1,//边宽度
			plotBorderWidth: 1,
			style: {
	                fontFamily: '宋体',
	                fontSize: '12px',
	                color:'#000000'
	        }
        },
        title: {
            text: '' //图表标题
        },
        subtitle: {
            text: '' //图表二级标题
        },
		credits: {
			enabled: false   //不显示LOGO
		},
        xAxis: { //X轴标签
            categories:[] ,
			labels: {
        		formatter:function(){  
        			return this.value; 
				},
				y:20
			}
        },
        yAxis: { //设置Y轴-（基站停电次数）
            min:0, 
        	allowDecimals:false,
            gridLineWidth: 1,  //设置Y轴网格宽度,默认了网格宽度为1
            title: {text: '基站个数（个）'},//Y轴标题设为空
            labels: {
                formatter: function() {//格式化标签名称
                    return this.value;
                },
                style: {
                    color: '#4572A7' //设置标签颜色
                }
            }

        },
        tooltip: { //鼠标滑向数据区显示的提示框
        	enabled : true,
            formatter: function() {  //格式化提示框信息
               return '' + this.x + '：<br/>' + this.y;
            }
        },
        plotOptions: { 
        	series: {
    			shadow:false,
                allowPointSelect: false,
                point: {
                	cursor: 'pointer',
                    events: {
                    	
                    }
                }
            },
		    column: {  
		         pointPadding: 0.2,  
		         borderWidth: 0,  
		         pointWidth: 20,  //柱宽度 
		         dataLabels: {
                     enabled: true,
                     formatter: function() {  //格式化提示框信息
		               return this.y; 
		            },
                    enableMouseTracking: true,
                    y:-15
                 }
		     }  
		}, 
        
        legend: { //设置图例
            layout: 'horizontal', //排列图例
			shadow: false, //设置阴影	
			align: 'center',
			verticalAlign: 'bottom',
			borderWidth: 1
        },
        series: [{  //数据列
            name: '',
            color: '#4572A7',
            type: 'column', //类型：曲线图
            yAxis: 0, //数据列关联到Y轴，默认是0，设置为1表示关联上述第二个Y轴
            data:  []
        }],
        exporting: {
            enabled: false
        }  
    };
   return options;
   
};


var  citys = {
		'石家庄市' : '114.48#38.03',　　
		　'唐山市' : '118.02#39.63',
		　'保定市' : '115.48#38.85',　　
		　'沧州市' : '116.83#38.33',
		　'廊坊市' : '116.70#39.53 ',
		　'衡水市' : '115.72#37.72',　
		　'邢台市' : '114.48#37.05',
		　'邯郸市' : '114.47#36.60',　
		'张家口市' : '114.87#40.82',
		　'承德市' : '117.93#40.97',　
		  '秦皇岛' : '119.57#39.95',
		  
		  
		  '霸州市' : '116.292815‎#39.464824',　　
		　'大厂回族自治县' : '116.980946#39.888431',
		　'大城县' : '116.644181#38.699564',　　
		　'固安县' : '116.303605#39.397057',
		　'廊坊市区' : '116.684315#39.527642',
		　'三河市' : '117.07972#39.986123',　
		　'文安县' : '116.457619#38.847789',
		　'香河县' : '117.005227#39.760857',　
		'永清县' : '116.542763#39.284948'
	}
