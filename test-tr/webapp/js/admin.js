
function onAdminReady()
{
	$(".apply-user-change").click(
			function()
			{
				$tr = $(this).parentsUntil("tr").parent().first();
				inputs = $tr.find('td input').serialize();
				options = "action=setuserrights&" + inputs;
				
				$.ajax({
					method: 'GET',
					url: 'adminAction.php?' + options,
					success: function(data) {
							if(data == "OK")
								this.css('background-color', 'inherit');
							else
								alert(data);
						},
					async: true,
					context: $tr
				});
			}
	);
	
	$(".delete-user").click(
			function()
			{
				$tr = $(this).parentsUntil("tr").parent().first();
				inputs = $tr.find('td input[name=username]').serialize();
				options = "action=deleteuser&" + inputs;
				
				$.ajax({
					method: 'GET',
					url: 'adminAction.php?' + options,
					success: function(data) {
							if(data == "OK")
								this.remove();
							else
								alert(data);
						},
					async: true,
					context: $tr
				});
			}
	);
	
	$(".userright").change(
			function()
			{
				$(this).parentsUntil("tr").parent().first().css('background-color', '#FFBBBB');
			}
	);
	
}
