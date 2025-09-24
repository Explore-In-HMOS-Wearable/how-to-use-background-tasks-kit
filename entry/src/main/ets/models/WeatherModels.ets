export enum WeatherTypes {
    SUNNY = 'Sunny',
    PARTIALLY_CLOUDY = 'Partially Cloudy',
    CLOUDY = 'Cloudy',
    RAINY = 'Rainy',
    SNOWY = 'Snowy'
}

export interface IForecast {
    time: string;
    forecast: WeatherTypes;
    image: Resource;
}