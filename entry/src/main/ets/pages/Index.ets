import { WeatherViewModel } from '../viewmodel/WeatherViewModel';
import { WeatherPage } from '../components/WeatherPage';

@Entry
@Component
struct Index {
    @State private weatherViewModel: WeatherViewModel = new WeatherViewModel();

    build() {
        Column() {
            Swiper() {
                WeatherPage({
                    hourlyForecasts: this.weatherViewModel.getHourlyForecasts(),
                    dailyForecast: this.weatherViewModel.getDailyForecast(true)
                })
                WeatherPage({
                    hourlyForecasts: this.weatherViewModel.getHourlyForecasts(),
                    dailyForecast: this.weatherViewModel.getDailyForecast(false)
                })
            }
            .padding({
                top: '15vp'
            })
            .margin({
                left: '20vp',
                right: '20vp'
            })
            .width('100%')
            .height('100%')
        }
        .backgroundColor(Color.Black)
        .height('100%')
        .width('100%')
    }
}