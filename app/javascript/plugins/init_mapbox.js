import mapboxgl from 'mapbox-gl';
// var mapboxgl = require('mapbox-gl/dist/mapbox-gl.js');
const mapElement = document.getElementById('map');

const initMapbox = () => {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11'
    });
    
    const markers = JSON.parse(mapElement.dataset.markers);
    
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });
};

export { initMapbox };