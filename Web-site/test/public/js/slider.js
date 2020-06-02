/*!
 * Slider.js v.1.0.0
 * Copyright John Sardañas
 * Released under the MIT license
 * Date: 03-22-2020
 */

function slider(parameter){
	const sliderItems = parameter.selector.firstElementChild.children, sliderPagination = document.createElement('ul');
	
	parameter.selector.firstElementChild.style.width = 1e2 * sliderItems.length + '%';

	parameter.selector.firstElementChild.querySelectorAll('.slide-item').forEach((slideItem, index) => {
		slideItem.dataset.slide = index;
		slideItem.style.width   = 1e2 / sliderItems.length + '%';
	});

	sliderContainerIndex = parameter.selector.querySelector('.slider-container').dataset.index = 0;

	const sliderWithPagination = () => {
		parameter.selector.append(sliderPagination);

		sliderPaginationItem = 0;

		while(sliderPaginationItem < sliderItems.length){
			sliderPagination.append(document.createElement('li'));
			sliderPaginationItem++;
		}

		sliderPagination.children[0].classList.add('active');

		for(let i = 0; i < sliderPagination.children.length; i++){
			sliderPagination.children[i].dataset.index = i;

			sliderPagination.children[i].addEventListener('click', e => {
				parameter.selector.querySelector('.slider-container').dataset.index = +e.target.dataset.index;
				parameter.selector.querySelector('.slider-container').style.marginLeft = (-1e2 * +e.target.dataset.index + '%');
				e.target.parentNode.querySelectorAll('li').forEach(item => {
					if(item.classList.contains('active')){
						item.classList.remove('active');
					}

					e.target.classList.add('active');
				});

				e.target.parentNode.parentNode.querySelectorAll('.slide-item').forEach(item => {
					if(item.classList.contains('active')){
						item.classList.remove('active');
					}

					if(item.dataset.slide == +e.target.dataset.index){
						item.classList.add('active');
					}
				});
			});
		}
	}

	const sliderWithArrows = () => {
		parameter.selector.firstElementChild.insertAdjacentHTML('afterend', '<button class="slider-next">→</button>');
		parameter.selector.firstElementChild.insertAdjacentHTML('beforebegin', '<button class="slider-previous">←</button>');

		const passActiveClass = () => {
			for(let i = 0; i < sliderPagination.children.length; i++){
				sliderPagination.children[i].dataset.index == parameter.selector.querySelector('.slider-container').dataset.index ? sliderPagination.children[i].classList.add('active') : sliderPagination.children[i].classList.remove('active');
			}
		}

		parameter.selector.querySelector('.slider-next').addEventListener('click', () => {
			parameter.selector.querySelector('.slider-container').dataset.index;
			parameter.selector.querySelector('.slider-container').dataset.index++;
			if(parameter.selector.querySelector('.slider-container').dataset.index >= sliderItems.length){
				parameter.selector.querySelector('.slider-container').dataset.index = 0;
			}
			parameter.selector.querySelector('.slider-container').dataset.index = parameter.selector.querySelector('.slider-container').dataset.index;
			parameter.selector.querySelector('.slider-container').style.marginLeft = (-1e2 * parameter.selector.querySelector('.slider-container').dataset.index + '%');
			passActiveClass();
		});

		parameter.selector.querySelector('.slider-previous').addEventListener('click', () => {
			parameter.selector.querySelector('.slider-container').dataset.index;
			parameter.selector.querySelector('.slider-container').dataset.index--;
			if(parameter.selector.querySelector('.slider-container').dataset.index < 0){
				parameter.selector.querySelector('.slider-container').dataset.index = sliderItems.length - 1;
			}
			parameter.selector.querySelector('.slider-container').dataset.index = parameter.selector.querySelector('.slider-container').dataset.index;
			parameter.selector.querySelector('.slider-container').style.marginLeft = (-1e2 * parameter.selector.querySelector('.slider-container').dataset.index + '%');
			passActiveClass();
		});
	}

	if(parameter.pagination == true || parameter.pagination == undefined){
		sliderWithPagination();
	}

	if(parameter.arrows == true){
		sliderWithArrows();
	}
}