// create fixed position page ToC sidecar
// eslint-disable-next-line no-unused-vars
window.addEventListener('DOMContentLoaded', (event) => {

  const toc = document.querySelector('#markdown-toc.toc_sidecar');
  
  if (toc) {
    // create sidecar and add copy of ToC
    const sidecar = document.createElement('nav');
    sidecar.id = 'toc-sidecar';
    sidecar.appendChild(toc.cloneNode(true));
    // remove id and class from clone child ol
    sidecar.querySelector('ol, ul').removeAttribute('id');
    sidecar.querySelector('ol, ul').removeAttribute('class');
    // add p with ToC label
    const tocLabel = document.createElement('p');
    tocLabel.textContent = 'On this page';
    sidecar.prepend(tocLabel);
    // add sidecar to page after main content
    const main = document.querySelector('main');
    main.after(sidecar);

    // check if toc is in viewport
    const tocObserver = new IntersectionObserver((entries) => {
      // toggle visibility when intersecting
      console.log(`ToC visible: ${entries[0].isIntersecting}`);
      sidecar.classList.toggle('visible', !entries[0].isIntersecting);
    }, {
      threshold: 0,
      rootMargin: '100px 0px 0px 0px'
    });
    tocObserver.observe(toc);

    // add scroll spy link highlighting
    // Select all the headings that correspond to the li items in the table of contents and do not have the no_toc class.
    const headings = document.querySelectorAll('h1:not(.no_toc), h2:not(.no_toc), h3:not(.no_toc), h4:not(.no_toc), h5:not(.no_toc), h6:not(.no_toc)');
    const tocLinks = sidecar.querySelectorAll('a');

    // Listen for the scroll event.
    window.addEventListener('scroll', () => {
      let index = headings.length;

      // Check the position of each heading.
      while (--index && window.scrollY + 100 < headings[index].offsetTop) { /* empty */ }

      // Remove the .active class from all li items.
      tocLinks.forEach((link) => link.classList.remove('active'));

      // Add the .active class to the current li item.
      tocLinks[index].classList.add('active');
    });
  }
  else {
    console.log('No sidecar ToC enabled.');
  }
});