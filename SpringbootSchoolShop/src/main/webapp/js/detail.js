/*
  本网站效果由昆明天度网络IRIS原创制作，未经同意不得转载
  商城用商品展示放大镜效果
*/
jQuery.ljsGlasses = {
    pcGlasses:function(_obj){
		var _box = $("#"+_obj.boxid);
		var _sum = $("#"+_obj.sumid);
		var _last,_next;
		var _imgarr = _box.find("img");
		var _length = _imgarr.length;
		var _index = 0;
		var _arr = new Array();
		_sum.append("<p style='position:absolute;left:0;top:0;'></p>");
		var _sumbox = _sum.find("p");
		
		for(var i=0;i<_length;i++){
			_arr[i] = new Array();
			_arr[i][0] = _imgarr.eq(i).attr("src");
			_arr[i][1] = _imgarr.eq(i).attr("width");
			_arr[i][2] = _imgarr.eq(i).attr("height");
			var _scale = _arr[i][1]/_arr[i][2];
			if(_scale == 1){
				_arr[i][3] = _obj.boxw;//width
				_arr[i][4] = _obj.boxh;//height
				_arr[i][5] = 0;//top
				_arr[i][6] = 0;//left
				_arr[i][7] = _obj.boxw/2;
				_arr[i][8] = _obj.boxw*2;//width
				_arr[i][9] = _obj.boxh*2;//height
				_sumbox.append("<span><img src='"+_imgarr.eq(i).attr("src")+"' width='"+_obj.sumw+"' height='"+_obj.sumh+"' /></span>");
				}
			if(_scale > 1){
				_arr[i][3] = _obj.boxw;//width
				_arr[i][4] = _obj.boxw/_scale;
				_arr[i][5] = (_obj.boxh-_arr[i][4])/2;
				_arr[i][6] = 0;//left
				_arr[i][7] = _arr[i][4]/2;
				_arr[i][8] = _obj.boxh*2*_scale;//width
				_arr[i][9] = _obj.boxh*2;//height
				var _place = _obj.sumh - (_obj.sumw/_scale);
				_place = _place/2;
				_sumbox.append("<span><img src='"+_imgarr.eq(i).attr("src")+"' width='"+_obj.sumw+"' style='top:"+_place+"px;' /></span>");
				}
			if(_scale < 1){
				_arr[i][3] = _obj.boxh*_scale;//width
				_arr[i][4] = _obj.boxh;//height
				_arr[i][5] = 0;//top
				_arr[i][6] = (_obj.boxw-_arr[i][3])/2;
				_arr[i][7] = _arr[i][3]/2;
				_arr[i][8] = _obj.boxw*2;//width
				_arr[i][9] = _obj.boxw*2/_scale;
				var _place = _obj.sumw - (_obj.sumh*_scale);
				_place = _place/2;
				_sumbox.append("<span><img src='"+_imgarr.eq(i).attr("src")+"' height='"+_obj.sumh+"' style='left:"+_place+"px;' /></span>");
				}
		}
		_imgarr.remove();
		
		_sum.append("<div style='clear:both;width:100%;'></div>");
		var _sumarr = _sum.find("span");
		var _sumimg = _sum.find("img");
		_sumarr.eq(_index).addClass(_obj.sumsel);
		var _border = _obj.sumborder*2 + _obj.sumh;
		var _sumwidth = (_border+_obj.sumi)*_obj.sums;
		var _sumboxwidth = (_border+_obj.sumi)*_length;
		_sum.css({
			"overflow":"hidden",
			"height":_border+"px",
			"width":_sumwidth+"px",
			"position":"relative"
			});
		_sumbox.css({
			"width":_sumboxwidth+"px"
			});
		_sumarr.css({
			"float":"left",
			"margin-left":_obj.sumi+"px",
			"width":_obj.sumw+"px",
			"height":_obj.sumh+"px",
			"overflow":"hidden",
			"position":"relative"
			});
		_sumimg.css({
			"max-width":"100%",
			"max-height":"100%",
			"position":"relative"
			});
		
		_box.append("<div style='position:relative;'><b style='display:block;'><img style='display:block;' src='' /></b><span style='position:absolute;left:0;top:0;display:none;z-index:5;'></span></div><p style='position:absolute;overflow:hidden;top:0;display:none;'><img style='max-width:none;max-height:none;position:relative;left:0;top:0;' src='' /></p>");
		var _glass = _box.find("span");
		var _boximg = _box.find("b img");
		var _imgout = _box.find("div");
		var _showbox = _box.find("p");
		var _showimg = _box.find("p img");

		_box.css({
			"width":_obj.boxw+"px",
			"height":_obj.boxh+"px",
			"position":"relative"
			});
		var _showboxleft = _obj.boxw + 10;
		_showbox.css({
			"width":_obj.boxw+"px",
			"height":_obj.boxh+"px",
			"left":_showboxleft+"px"
			});
		
		var imgPlaces = function(){
			_showimg.attr("src",_arr[_index][0]);
			_boximg.attr("src",_arr[_index][0]);
			_boximg.css({
			    "width":_arr[_index][3]+"px",
			    "height":_arr[_index][4]+"px"
			});
			_imgout.css({
				"width":_arr[_index][3]+"px",
			    "height":_arr[_index][4]+"px",
			    "top":_arr[_index][5]+"px",
			    "left":_arr[_index][6]+"px",
			    "position":"relative"
			});
			_glass.css({
			    "width":_arr[_index][7]+"px",
			    "height":_arr[_index][7]+"px"
			});
			_showimg.css({
				"width":_arr[_index][8]+"px",
			    "height":_arr[_index][9]+"px"
			});
			
		};
		imgPlaces();
		
		_imgout.mousemove(function(e){
			var _gl_w = _glass.width()/2;
			var _maxX = _imgout.width() - _gl_w;
			var _maxY = _imgout.height() - _gl_w;
			var _moveX = 0,_moveY = 0;
			var _nowX = e.pageX - _imgout.offset().left;
		    var _nowY = e.pageY - _imgout.offset().top;
			var _moveX = _nowX-_gl_w,_moveY = _nowY-_gl_w;
			
			if(_nowX <= _gl_w){ _moveX = 0; }
			if(_nowX >= _maxX){ _moveX = _maxX-_gl_w; }
			if(_nowY <= _gl_w){ _moveY = 0;}
			if(_nowY >= _maxY){ _moveY = _maxY-_gl_w;}
			_glass.css({"left":_moveX+"px","top":_moveY+"px"});

			var _imgX = -_moveX*_showbox.width()/_glass.width();
			var _imgY = -_moveY*_showbox.width()/_glass.width();
			_showimg.css({"left":_imgX+"px","top":_imgY+"px"});
	
		});//mouse END
		
		_imgout.mouseenter(function(){
			_glass.css("display","block");
			_showbox.css("display","block");
			});
		_imgout.mouseleave(function(){
			_glass.css("display","none");
			_showbox.css("display","none");
			});
		
		//列表部分
		var _nextbtn = $("#"+_obj.nextid);
		var _lastbtn = $("#"+_obj.lastid);
		var _moveindex = 0;//索引移动
		
		var _sumListMove = function(){
			var _leftmove = -_moveindex*(_border+_obj.sumi);
			if(_sumbox.is(":animated")){_sumbox.stop(true,true);}
			_sumbox.animate({left:_leftmove+"px"},300);
			_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			imgPlaces();
		};//fun END
		
		if(_length <= _obj.sums){
			var _place = (_obj.sums-_length)*_border/2;
			_sumbox.css("left",_place+"px");
			_nextbtn.click(function(){
				_index++;
				if(_index >= _length){ _index=_length-1;}
				_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			    imgPlaces();
			});
			_lastbtn.click(function(){
				_index--;
				if(_index <= 0){ _index=0;}
				_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			    imgPlaces();
			});
		}else{
			var _maxNum = _length-_obj.sums;
			_nextbtn.click(function(){
			   _moveindex++;
			   if(_moveindex >= _maxNum){ _moveindex=_maxNum; }
			   if(_index <= _moveindex){ _index=_moveindex;}
			   _sumListMove();
		    });
			_lastbtn.click(function(){
				_moveindex--;
				if(_moveindex <= 0){ _moveindex=0;}
				if(_index >= _moveindex+_obj.sums){ _index=_moveindex+_obj.sums-1;}
				_sumListMove();
			});
		}//if END

		_sumarr.hover(function(){
			_index = $(this).index();
			_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			imgPlaces();
		});
	
  }//pcGlasses END
}//ljsGlasses END