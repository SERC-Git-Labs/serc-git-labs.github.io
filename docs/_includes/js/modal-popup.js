// create modal popups
// eslint-disable-next-line no-unused-vars
window.addEventListener('DOMContentLoaded', (event) => {

  // Select all modal-popup elements
  const modalPopups = document.querySelectorAll('.modal-popup');
  
  if (modalPopups) {
    // Create modal popup for wide content
    const modal = document.createElement('div');
    modal.classList.add('modal');

    // Create modal content
    const modalContent = document.createElement('div');
    modalContent.classList.add('modal-content');
    modal.appendChild(modalContent);

    // Add click event listener to each modal-popup element
    modalPopups.forEach((popup) => {
      console.log(`Modal popup found: ${popup}`);
      popup.addEventListener('click', (event) => {
        // Prevent default link behavior
        event.preventDefault();


        // Add modal content to modal popup
        modalContent.appendChild(popup.cloneNode(true));

        // Add modal to page
        document.body.appendChild(modal);

        modal.style.opacity = '1';
        modalContent.style.transform = 'scale(1)';

        // Add click event listener to modal
        modal.addEventListener('click', (event) => {
          // Prevent default link behavior
          event.preventDefault();

          modal.style.opacity = '0';
          modalContent.style.transform = 'scale(0)';

          // Remove modal content from modal popup
          modalContent.innerHTML = '';

          // Remove modal from page
          modal.remove();
        });
      });
    });
  }
  else {
    console.log('No modal popups enabled.');
  }
});