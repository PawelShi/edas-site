var myMap; 
var myCenter = [58.006877, 56.287285];
    

// Дождёмся загрузки API и готовности DOM.
ymaps.ready(init);

function init () {
    // Создание экземпляра карты и его привязка к контейнеру с
    // заданным id ("map").
    var myPlacemark;
    myMap = new ymaps.Map ("map", {
                //center: [57.996401, 56.304498],
                center: myCenter,
                zoom: 17,
                type: "yandex#map",
                behaviors: ["default", "scrollZoom"],
                type: "yandex#publicMap"
            }); 
            
    myPlacemark = new ymaps.Placemark(myCenter, {
                hintContent: 'ООО "ЭДАС"',
                balloonContent: 'Расположение офиса ООО "ЭДАС" - каб.156'
    });
            
    myMap.geoObjects.add(myPlacemark);
    myMap.controls.add('mapTools');
    myMap.controls.add('typeSelector');
    myMap.controls.add('zoomControl');
    myMap.controls.add('scaleLine');
}
