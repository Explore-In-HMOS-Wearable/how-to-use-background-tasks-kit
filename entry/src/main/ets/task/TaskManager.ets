import { workScheduler } from '@kit.BackgroundTasksKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0xFF00;
const TAG = 'WeatherTaskManager';

export class WeatherTaskManager {
  static readonly workId = 1;
  static readonly bundleName = 'com.dtse.simple_weather';
  static readonly abilityName = 'WeatherWorker';

  static startWeatherSyncTask(): void {
    const workInfo: workScheduler.WorkInfo = {
      workId: WeatherTaskManager.workId,
      batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW_OR_OKAY,
      bundleName: WeatherTaskManager.bundleName,
      abilityName: WeatherTaskManager.abilityName,
      repeatCycleTime: 2
    };

    try {
      workScheduler.startWork(workInfo);
      hilog.info(DOMAIN, TAG, '%{public}s', '✅ startWork success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, '❌ startWork failed. Code: %{public}d, Msg: %{public}s',
        (error as BusinessError).code,
        (error as BusinessError).message);
    }
  }

  static stopWeatherSyncTask(): void {
    const workInfo: workScheduler.WorkInfo = {
      workId: WeatherTaskManager.workId,
      batteryStatus: workScheduler.BatteryStatus.BATTERY_STATUS_LOW_OR_OKAY,
      networkType: workScheduler.NetworkType.NETWORK_TYPE_WIFI,
      bundleName: WeatherTaskManager.bundleName,
      abilityName: WeatherTaskManager.abilityName
    };

    try {
      workScheduler.stopWork(workInfo);
      hilog.info(DOMAIN, TAG, '%{public}s', '🛑 stopWork success');
    } catch (error) {
      hilog.error(DOMAIN, TAG, '❌ stopWork failed. Code: %{public}d, Msg: %{public}s',
        (error as BusinessError).code,
        (error as BusinessError).message);
    }
  }

  static queryTasks(): void {
    workScheduler.obtainAllWorks().then((runningWorks) => {
      hilog.info(DOMAIN, TAG, '✅ Deferred tasks running: %{public}d', runningWorks.length);
      runningWorks.forEach((task) => {
        hilog.info(DOMAIN, TAG, '➡️ WorkId: %{public}d, abilityName: %{public}s',
          task.workId,
          task.abilityName);
      });
    }).catch((error: BusinessError) => {
      hilog.error(DOMAIN, TAG, '❌ Failed to query tasks. Code: %{public}d, Msg: %{public}s',
        error.code,
        error.message);
    });
  }
}
