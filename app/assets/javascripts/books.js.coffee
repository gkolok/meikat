# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
        $('#books').dataTable
          bStateSave: true
          sPaginationType: "full_numbers"
          bProcessing: true
          bServerSide: true
          sAjaxSource: $('#books').data('source')
          aoColumnDefs: [
            {sWidth: "22%",aTargets: [ 0 ]},
            {sWidth: "32%",aTargets: [ 1 ]},
            {sWidth: "15%",aTargets: [ 3 ]}
            {sWidth: "3%",aTargets: [ 4 ]}
            {sWidth: "5%",aTargets: [ 5 ]}
          ]
          "oLanguage":
             "sEmptyTable":     "Nincs rendelkezésre álló adat",
             "sInfo":           "Találatok: _START_ - _END_ Összesen: _TOTAL_",
             "sInfoEmpty":      "0 találat",
             "sInfoFiltered":   "(_MAX_ összes rekord közül szűrve)",
             "sInfoPostFix":    "",
             "sInfoThousands":  " ",
             "sLengthMenu":     "_MENU_ találat oldalanként",
             "sLoadingRecords": "Betöltés...",
             "sProcessing":     "Feldolgozás...",
             "sSearch":         "Keresés:",
             "sZeroRecords":    "Nincs a keresésnek megfelelő találat",
             "oPaginate":
                 "sFirst":    "Első",
                 "sPrevious": "<",
                 "sNext":     ">",
                 "sLast":     "Utolsó"
             "oAria":
                 "sSortAscending":  ": aktiválja a növekvő rendezéshez",
                 "sSortDescending": ": aktiválja a csökkenő rendezéshez"
