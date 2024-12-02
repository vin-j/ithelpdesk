/**
 * 
 */
 
 
	
			let currentpage = 1;
			const itemsperpage = 10;
			
			
			function previouspage(){
				
				if(currentpage > 1){
					currentpage--;
					paginate();
				}
			}

			function nextpage(){
				const incidentitems = document.querySelectorAll("#mobile-container .incident-item");
				const totalpages = Math.ceil(incidentitems.length / itemsperpage);
				if(currentpage < totalpages){
					currentpage++;
					paginate();
				}
				
			}

			function paginate(){
				
				const incidentitems = document.querySelectorAll("#mobile-container .incident-item");
				const totalitems = incidentitems.length;
				const totalpages = Math.ceil(totalitems / itemsperpage );
				const start = (currentpage -1) * itemsperpage + 1 ;
				const end = Math.min(currentpage * itemsperpage , totalitems);
				
				incidentitems.forEach((item,index) => {
					
			        if (index >= (currentpage - 1) * itemsperpage && index < currentpage * itemsperpage) {
							item.style.display = "block";
						}
			        else{
			        	item.style.display = "none";
			        }
				});
				
				
				const summary = document.getElementById("pagination-summary");
				if(summary){
					summary.textContent = `Showing ${start} to ${end} of ${totalitems} entries`;
				}					
				
				console.log(`Page ${currentpage} of ${totalpages}`);
				
			}
			
			
			document.addEventListener("DOMContentLoaded", function () {
					paginate();
				});
				
		
			function filterMobileIncidents(){
				const input = document.getElementById("mobile-search").value.toLowerCase();
				const incidents = document.querySelectorAll("#mobile-container .incident-item");
				
				incidents.forEach((incident) => {
					if(incident.textContent.toLowerCase().includes(input))
					{
						incident.style.display ="block";
					}else{
						incident.style.display = "none";
					}
					
				});
				
				paginateFiltered();
				//currentpage = 1;
				//paginate();
				
			}


