(function(){
	
	var seqIdEle = $("#seqId");
	var activityTitleEle = $("#activityTitle");
	var activityLinkEle = $("#activityLink");
	var activitySeqEle = $("#activitySeq");
	var addButtonEle = $("#addButton");
	var updateButtonEle = $("#updateButton");
	var resetButtonEle = $("#resetButton");
	
	//-----------------增加一条记录-----------------
    addButtonEle.on("click",function(){
    	var activityTitle = activityTitleEle.val();
    	var activityLink = activityLinkEle.val();
    	var activitySeq = activitySeqEle.val();
        if((activityTitle!="")&&(activityLink!="")&&(activitySeq!="")){
        	var dataJson= {
                "activityTitle":activityTitle,
                "activityLink":activityLink,
                "activitySeq":activitySeq
            };
        	$.ajax({
                type: 'POST',
                url: "http://localhost:8081/WechatHotActivity/addOne.do",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(dataJson),
                dataType: 'json',
                success: function(resp){
                    alert("增加成功" + JSON.stringify(resp));
                    history.go(0);
                },
                error: function (err) {
                    alert("增加失败");
                }
            });
        }
        else{
        	alert("请填写信息");
        }    
    });
	
  	//-----------------更新一条记录-----------------
  	$("table button[name='edit']").on("click", function( e ) {
  		var currTarget = $( e.target ).closest("tr").children("td");
  		var currId = currTarget.eq("0").text();
  		var currTitle = currTarget.eq("1").text();
  		var currLink = currTarget.eq("2").text();
    	var currSeq = currTarget.eq("3").text();
    	seqIdEle.val(currId);
    	activityTitleEle.val(currTitle);
    	activityLinkEle.val(currLink);
    	activitySeqEle.val(currSeq);
    	updateButtonEle.removeClass("dn");
		addButtonEle.addClass("dn");
    });
  	
  	updateButtonEle.on("click", function() {
  		var seqId = seqIdEle.val();
    	var activityTitle = activityTitleEle.val();
    	var activityLink = activityLinkEle.val();
    	var activitySeq = activitySeqEle.val();
    	if((activityTitle!="")&&(activityTitle!="")&&(activityLink!="")&&(activitySeq!="")){
    		var dataJson= {
    			"seqId":seqId,
    			"activityTitle":activityTitle,
    	        "activityLink":activityLink,
    	        "activitySeq":activitySeq
    	    };
    	    $.ajax({
				type: 'POST',
    	        url: "http://localhost:8081/WechatHotActivity/updateOne.do",
    	        contentType: "application/json; charset=utf-8",
    	        data: JSON.stringify(dataJson),
    	        dataType: 'json',
    	        success: function(resp){
    	        	alert("更新成功" + JSON.stringify(resp));
					history.go(0);
				},
				error: function (err) {
    	            alert("更新失败");
    	        }
			});
    	}
    });	
  	
  
  	//-----------------删除一条记录-----------------
	$("table button[name='delete']").on("click", function( e ) {
    	var currId = $( e.target ).closest("tr").children("td").eq("0").text();
    	var r=confirm("确认要删除？")
    	if(r==true){
    		doDelete();
    	}
    	else{
    	}
    	
    	function doDelete(){
            var dataJson= {
            	"seqId":currId
            };
            $.ajax({
                type: 'POST',
                url: "http://localhost:8081/WechatHotActivity/deleteOne.do",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(dataJson),
                dataType: 'json',
                success: function(resp){
                    alert("删除成功" + JSON.stringify(resp));
                    history.go(0);
                },
                error: function (err) {
                    alert("删除失败");
                }
            });
        };
    });	
  	
  	
	//-----------------重置-----------------
	resetButtonEle.on("click", function() {
		seqIdEle.val("");
    	activityTitleEle.val("");
    	activityLinkEle.val("");
    	activitySeqEle.val("");
		addButtonEle.removeClass("dn");
		updateButtonEle.addClass("dn");
    });	
	
})(jQuery)