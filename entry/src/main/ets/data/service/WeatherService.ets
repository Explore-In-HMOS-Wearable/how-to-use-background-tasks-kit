import { IForecast, WeatherTypes } from '../../models/WeatherModels';

export class WeatherService {
    static async fetchForecast(): Promise<IForecast[]> {

        const data: IForecast[] = [
            {
                time: '12:00-14:00',
                forecast: WeatherTypes.SUNNY,
                image: $rawfile('sunny.png')
            },
            {
                time: '14:00-16:00',
                forecast: WeatherTypes.PARTIALLY_CLOUDY,
                image: $rawfile('partially_cloudy.png')
            },
            {
                time: '16:00-18:00',
                forecast: WeatherTypes.CLOUDY,
                image: $rawfile('cloudy.png')
            },
            {
                time: '18:00-20:00',
                forecast: WeatherTypes.RAINY,
                image: $rawfile('rainy.png')
            },
            {
                time: '20:00-22:00',
                forecast: WeatherTypes.RAINY,
                image: $rawfile('rainy.png')
            }
        ];

        return new Promise((resolve) => {
            setTimeout(() => {
                resolve(data);
                console.info(`✅ WeatherService return`);
            }, 1000);
        });
    }
}