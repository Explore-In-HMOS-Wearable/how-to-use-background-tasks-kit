import WorkSchedulerExtensionAbility from '@ohos.WorkSchedulerExtensionAbility';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { WeatherService } from '../data/service/WeatherService';
import { workScheduler } from '@kit.BackgroundTasksKit';

const DOMAIN = 0xFFFF;

export default class WeatherWorker extends WorkSchedulerExtensionAbility {
  async onWorkStart(workInfo: workScheduler.WorkInfo): Promise<void> {
    hilog.info(DOMAIN, 'WeatherWorker', 'Deferred task started');
    const forecast = await WeatherService.fetchForecast();

    hilog.info(DOMAIN, 'WeatherWorker', `Fetched ${forecast.length} forecast entries`);
  }

  onWorkStop(workInfo: workScheduler.WorkInfo): void {
    hilog.info(DOMAIN, 'WeatherWorker', 'Deferred task stopped');
  }
}
