import { IForecast } from '../models/WeatherModels';

@Component
export struct WeatherPage {
    @Prop hourlyForecasts: IForecast[];
    @Prop dailyForecast: IForecast;

    build() {
        Column() {
            Text(this.dailyForecast.time)
                .fontSize('20vp')
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
            Blank().height('5vp')

            Image(this.dailyForecast.image)
                .width('60vp')
                .aspectRatio(1)
            Text(this.dailyForecast.forecast)
                .fontSize('15vp')
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
            Blank().height('15vp')

            Row() {
                ForEach(this.hourlyForecasts.slice(0, 3), (hourlyForecast: IForecast) => {
                    Column() {
                        Image(hourlyForecast.image)
                            .width('20vp')
                            .aspectRatio(1)
                        Blank().height('5vp')
                        Text(hourlyForecast.time)
                            .fontSize('7vp')
                            .fontWeight(FontWeight.Bold)
                            .fontColor(Color.White)
                    }
                }, (hourlyForecast: IForecast) => hourlyForecast.time)
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceAround)
            Blank().height('5vp')
            Row() {
                ForEach(this.hourlyForecasts.slice(3), (hourlyForecast: IForecast) => {
                    Column() {
                        Image(hourlyForecast.image)
                            .width('20vp')
                            .aspectRatio(1)
                        Blank().height('5vp')
                        Text(hourlyForecast.time)
                            .fontSize('7vp')
                            .fontWeight(FontWeight.Bold)
                            .fontColor(Color.White)
                    }
                }, (hourlyForecast: IForecast) => hourlyForecast.time)
            }
            .width('70%')
            .justifyContent(FlexAlign.SpaceAround)
        }
    }
}