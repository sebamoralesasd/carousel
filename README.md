# carousel

Es una pequeña app que publica una foto de perfil con rotación proporcional a los minutos de la hora y en sentido horario.

## Uso
Ejecutar `bundle install` para instalar las dependencias de la app.

Para que la app pueda tuitear, definir las variables de entorno usadas en el cliente de Twitter.
```ruby
def client
  Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV.fetch('TWITTER_APP_CONSUMER_KEY', nil)
    config.consumer_secret     = ENV.fetch('TWITTER_APP_CONSUMER_SECRET', nil)
    config.access_token        = ENV.fetch('TWITTER_ACCESS_TOKEN', nil)
    config.access_token_secret = ENV.fetch('TWITTER_ACCESS_TOKEN_SECRET', nil)
  end
end
```
