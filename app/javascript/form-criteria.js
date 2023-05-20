document.addEventListener('DOMContentLoaded', function() {
    var modalTopDelete = document.getElementById('modalTopDelete');
  
    modalTopDelete.addEventListener('show.bs.modal', function(event) {
      var link = event.relatedTarget;
      var linkId = link.getAttribute('data-id');
      console.log("ID from link: " + linkId);
      var deleteIdInput = document.getElementById('deleteid');
      deleteIdInput.value = linkId;
      // Gunakan ID yang diterima untuk tujuan yang diinginkan
      // Misalnya, lakukan tindakan penghapusan berdasarkan ID tersebut
      var deleteButton = modalTopDelete.querySelector('.btn-danger');
      deleteButton.setAttribute('data-id', linkId);
    });

  });
  