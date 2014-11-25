<script src="//api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
// <script src="http://api-maps.yandex.ru/2.0-stable/?load=package.standard&lang=ru-RU" 
//     type="text/javascript">
//     <script type="text/javascript">
//         ymaps.ready(init);

//         function init () {
//             var myMap = new ymaps.Map('map', {
//                 center: [55.76, 37.64], 
//                 zoom: 10
//             });
//         }
//     </script>



// </script>
<script type="text/javascript">
        ymaps.ready(init);
        var myMap, 
            myPlacemark;

        function init(){ 
            myMap = new ymaps.Map ("map", {
                center: [57.996401, 56.304498],
                zoom: 17,
                type: "yandex#map",
                behaviors: ["default", "scrollZoom"],
                type: "yandex#publicMap"
            }); 
            
            myPlacemark = new ymaps.Placemark([57.996401, 56.304498], {
                hintContent: 'ООО "ЭДАС"',
                balloonContent: 'Расположение офиса ООО "ЭДАС" - каб.318'
            });
            
            myMap.geoObjects.add(myPlacemark);
            myMap.controls.add('mapTools');
            myMap.controls.add('typeSelector');
            myMap.controls.add('zoomControl');
            myMap.controls.add('scaleLine');
        }
    </script>



