			var price = document.getElementById("price");
			var num = document.getElementById("num");
			var result = document.getElementById("result")

			var grindingSelect = document.getElementById("weight");
			var grindingSelect = document.getElementById("grindingState");
			var grindingSelect = document.getElementById("deliveryMethod");

			//console.log(menuSelect);

			if(grindingSelect.value=="typeSelect"){
				alert("분쇄상태를 선택해주세요.");
				grindingSelect.focus();
				return false;
			}

			if(num.value==""){
				alert("수량을 입력하세요");
				num.focus();
				result="2";
				// result.value는 input 공간에 표현하려고 하는 작업!
				// result는 변수공간 자체를 깨끗하게 비워준 형태!
			}
	


			result.value = price.value*num.value;
