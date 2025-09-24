import { IForecast, WeatherTypes } from '../models/WeatherModels';

@Observed
export class WeatherViewModel {
    todaysForecast: IForecast = {
        time: 'Today',
        forecast: WeatherTypes.RAINY,
        image: $rawfile('rainy.png')
    }

    tomorrowsForecast: IForecast = {
        time: 'Tomorrow',
        forecast: WeatherTypes.RAINY,
        image: $rawfile('rainy.png')
    }

    hourlyForecasts: IForecast[] = [
        {
            time: '12:00-14:00',
            forecast: WeatherTypes.RAINY,
            image: $rawfile('rainy.png')
        },
        {
            time: '14:00-16:00',
            forecast: WeatherTypes.CLOUDY,
            image: $rawfile('cloudy.png')
        },
        {
            time: '16:00-18:00',
            forecast: WeatherTypes.PARTIALLY_CLOUDY,
            image: $rawfile('partially_cloudy.png')
        },
        {
            time: '18:00-20:00',
            forecast: WeatherTypes.PARTIALLY_CLOUDY,
            image: $rawfile('partially_cloudy.png')
        },
        {
            time: '20:00-22:00',
            forecast: WeatherTypes.SNOWY,
            image: $rawfile('snowy.png')
        }
    ];

    public getHourlyForecasts(): IForecast[] {
        return this.hourlyForecasts;
    }
    public getDailyForecast(isToday: boolean): IForecast {
        return isToday ? this.todaysForecast : this.tomorrowsForecast;
    }
}
