// // console.log("Document Loaded");
// // Dropdown table
// document.querySelectorAll('.dropdown-item').forEach(item => {
//     item.addEventListener('click', function() {
//         const filterType = this.getAttribute('data-filter');

//         // Hide all visit lists
//         document.querySelectorAll('.visit-list').forEach(list => {
//             list.style.display = 'none';
//         });

//         // Show the selected list based on the filter type
//         if (filterType === 'month') {
//             document.getElementById('month-visits').style.display = 'block';
//         } else if (filterType === 'valid') {
//             document.getElementById('valid-visits').style.display = 'block';
//         } else if (filterType === 'expired') {
//             document.getElementById('expired-visits').style.display = 'block';
//         } else if (filterType === 'emergency') {
//             document.getElementById('emergency-visits').style.display = 'block';
//         }
//     });
// });

// function openCard(visitId) {
//     $('#visitId').val(visitId);
//     $('#visitModal').modal('show');
// }

// function openCard2(invoiceId) {
//     $('#invoiceId').val(invoiceId);
//     $('#invoiceModal').modal('show');
// }

// function openCard3(emergencyVisitId) {
//     $('#emergencyVisitId').val(emergencyVisitId);
//     $('#emergencyVisitModal').modal('show');
// }

// // Validation on Modal fields
// function validateFileType() {
//     // Get file inputs
//     var imageInput = document.getElementById('visit_image');
//     var pdfInput = document.getElementById('visit_pdf');
  
//     // Error message elements
//     var imageError = document.getElementById('imageError');
//     var pdfError = document.getElementById('pdfError');
  
//     // Check image file type
//     if (imageInput.files.length > 0) {
//         var imageFile = imageInput.files[0];
//         var allowedImageTypes = ['image/jpeg', 'image/png'];
//         if (!allowedImageTypes.includes(imageFile.type)) {
//             imageError.style.display = 'block';
//             return false;  // Prevent submission
//         } else {
//             imageError.style.display = 'none';  // Hide error
//         }
//     }
  
//     // Check PDF file type
//     if (pdfInput.files.length > 0) {
//         var pdfFile = pdfInput.files[0];
//         if (pdfFile.type !== 'application/pdf') {
//             pdfError.style.display = 'block';
//             return false;  // Prevent submission
//         } else {
//             pdfError.style.display = 'none';  // Hide error
//         }
//     }
  
//     return true; 
// }

// // Submit the form of maintenance visits
// function submitVisitForm() {
//     // Validate file types before submitting
//     if (!validateFileType()) {
//       return;  // Stop form submission if validation fails
//     }
//     // Get form element
//     var form = document.getElementById('visitForm');
    
//     // Check if form is valid
//     if (form.checkValidity()) {
//       console.log('Form is valid. Preparing to submit.'); // Debug log
//       var formData = new FormData(form);
      
//       $.ajax({
//         url: updateMaintenanceUrl,  // Django URL for handling the update
//         type: 'POST',
//         data: formData,
//         processData: false,
//         contentType: false,
//         headers: {
//           'X-CSRFToken': '{{ csrf_token }}'  // Ensure CSRF token is included for Django
//         },
//         success: function(response) {
//           if (response.success) {
//             $('#visitModal').modal('hide');
//             location.reload();  // Reload the page to update the table
//           } else {
//             alert('Error: ' + response.error);
//           }
//         },
//         error: function(xhr, status, error) {
//           console.error('AJAX error: ', error);
//         }
//       });
//     } else {
//       // If the form is invalid, trigger browser validation
//       form.reportValidity();
//     } 
//   }

// // Submit the form of emergency visits
// function submitEmergencyVisitForm() {
//     // Validate file types before submitting
//     if (!validateFileType()) {
//       return;  // Stop form submission if validation fails
//     }
//     // Get form element
//     var form = document.getElementById('emergencyVisitForm');
    
//     // Check if form is valid
//     if (form.checkValidity()) {
//       console.log('Form is valid. Preparing to submit.'); // Debug log
//       var formData = new FormData(form);
      
//       $.ajax({
//         url: updateEmergencyUrl,  // Django URL for handling the update
//         type: 'POST',
//         data: formData,
//         processData: false,
//         contentType: false,
//         headers: {
//           'X-CSRFToken': '{{ csrf_token }}'  // Ensure CSRF token is included for Django
//         },
//         success: function(response) {
//           if (response.success) {
//             $('#emergencyVisitModal').modal('hide');
//             location.reload();  // Reload the page to update the table
//           } else {
//             alert('Error: ' + response.error);
//           }
//         },
//         error: function(xhr, status, error) {
//           console.error('AJAX error: ', error);
//         }
//       });
//     } else {
//       // If the form is invalid, trigger browser validation
//       form.reportValidity();
//     } 
//   }

// // Submit the form of invoice
// function submitInvoiceForm() {
//     // Validate file types before submitting
//     if (!validateFileType()) {
//       return;  // Stop form submission if validation fails
//     }
//     // Get form element
//     var form = document.getElementById('invoiceForm');
    
//     // Check if form is valid
//     if (form.checkValidity()) {
//       console.log('Form is valid. Preparing to submit.'); // Debug log
//       var formData = new FormData(form);
      
//       $.ajax({
//         url: updateInvoiceUrl,  // Django URL for handling the update
//         type: 'POST',
//         data: formData,
//         processData: false,
//         contentType: false,
//         headers: {
//           'X-CSRFToken': '{{ csrf_token }}'  // Ensure CSRF token is included for Django
//         },
//         success: function(response) {
//           if (response.success) {
//             $('#invoiceModal').modal('hide');
//             location.reload();  // Reload the page to update the table
//           } else {
//             alert('Error: ' + response.error);
//           }
//         },
//         error: function(xhr, status, error) {
//           console.error('AJAX error: ', error);
//         }
//       });
//     } else {
//       // If the form is invalid, trigger browser validation
//       form.reportValidity();
//     } 
//   }

// // Redirect after submit 
// function redirectToDashboard() {
// window.location.href = dashboardUrl; 
// }


// // // Maintenance Chart
// // var ctx1 = document.getElementById("maintenancePieChart").getContext("2d");
// // var myPieChart = new Chart(ctx1, {
// //     type: 'pie',
// //     data: {
// //         labels: ['Done', 'Not Done'],
// //         datasets: [{
// //             data: [doneCount, notDoneCount],
// //             backgroundColor: ['#4CAF50', '#F44336'], // Colors for done and not done
// //         }]
// //     },
// //     options: {
// //         responsive: true,
// //         maintainAspectRatio: false,
// //         plugins: {
// //             legend: {
// //                 position: 'top',
// //             },
// //             tooltip: {
// //                 callbacks: {
// //                     label: function(tooltipItem) {
// //                         return tooltipItem.label + ': ' + tooltipItem.raw;
// //                     }
// //                 }
// //             }
// //         }
// //     }
// // });


// // Invoice Chart
// // var ctx = document.getElementById("myBarChart").getContext("2d");
// // new Chart(ctx, {
// //     type: "bar",
// //     data: {
// //         labels: [`Done Invoices (${doneInvoicesCount})`, 
// //                 `Not Done Invoices (${notDoneInvoicesCount})`],
// //         datasets: [{
// //             backgroundColor: ['#4CAF50', '#F44336'],  
// //             data: [doneInvoicesAmount, notDoneInvoicesAmount],  
// //         }]
// //     },
// //     options: {
// //         responsive: true,
// //         maintainAspectRatio: false,
// //         plugins: {
// //         legend: {
// //             display: false  // Hide the legend
// //         }
// //         },
// //         scales: {
// //             y: {
// //                 beginAtZero: true,  // Y-axis starts at 0
// //                 ticks: {
// //                     font: {
// //                         size: 14,
// //                         family: "Open Sans"
// //                     },
// //                     color: "#333"
// //                 },
// //                 title: {
// //                     display: true,
// //                     text: '(EGP)'
// //                 },
// //                 grid: {
// //                 display: false  
// //                 }
// //             },
// //             x: {
// //                 ticks: {
// //                     font: {
// //                         size: 14,
// //                         family: "Open Sans",
// //                         style: "normal",
// //                         weight: "normal"
// //                     },
// //                     color: "#333"
// //                 },
// //                 grid: {
// //                 display: false  
// //                 }
         
// //             }
// //         },

// //     }
// // });



