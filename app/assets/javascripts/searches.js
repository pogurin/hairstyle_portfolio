$.get('/hairdressers?search=' + searchValue)
      .done(function(data){
        console.log(data);
        $('#hairdressers').html(data);
      });