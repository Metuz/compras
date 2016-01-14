# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
   $('#usuarios').dataTable
        pagingType: 'full_numbers'
        'language': 'lengthMenu': 'Ver _MENU_ ',"emptyTable": "Sin datos que mostrar","info": "Observando _TOTAL_ de _MAX_","infoEmpty": "Sin datos que mostrar","infoFiltered": "","zeroRecords": "Sin coincidencias",'search': 'Buscar','paginate':"first": 'Primera',"next": "Siguiente","last": "Ultima","previous": "Anterior"
 
    