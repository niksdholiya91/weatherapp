class EndPoints {
  ///---------------------------------------------- Api Key ----------------------------------------------
  static const apiKey = 'c6d805c8b0751dab4dfda08908b90ee0';

  ///---------------------------------------------- Base url ----------------------------------------------
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/';

  ///---------------------------------------------- End points ----------------------------------------------
  static const weather = baseUrl + "weather?";
  static const oneCall = baseUrl + "onecall?";
  static const timeMachine = baseUrl + "onecall/timemachine?";

  ///---------------------------------------------- Keys ----------------------------------------------
  static const lat = "lat=";
  static const lon = "lon=";
  static const appId = "appid=";
  static const exclude = "exclude=";
  static const dt = "dt=";

  static const current = "current";
  static const minutely = "minutely";
  static const hourly = "hourly";
  static const daily = "daily";
  static const alerts = "alerts";
}
