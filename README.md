# SOAT

La aplicación web SOAT permite al usuario consultar información acerca del seguro obligatorio de accidentes de transito. Así como adquirirlo y descargar un comprobante en PDF.
Adicionalmente permite al administrador revisar los seguros vendidos y los autos registrados.
Para calcular los valores se basa en [TARIFAS MAXIMAS COMERCIALES DEL SOAT 2017](http://www.fasecolda.com/files/1114/8406/4009/Tarifas_soat_2016C004-09.pdf).

## Guia

Para correr la aplicación local (development)

### Requerimientos

* Ruby 2.4.1
* Rails 5.0.3
* PostgreSQL 9.6
* PhantomJS 2.1.1
* [Mailcatcher](https://mailcatcher.me/)

### Configuración

1. Ejecutar `bundle install` para instalar las gemas
2. Copiar el arhivo de configuración .env y configurarlo de acuerdo a tu equipo local (usuario y password para la [API](#api)).

        cp .env.example .env

3. Inicializar la base de datos (create, migrate y seed).

        bundle exec rake db:setup

4. Instalar y arrancar mailcatcher para recibir los correos.

        gem install mailcatcher
        mailcatcher

5. **Opcional:** Instalar y arrancar [Zeus](https://github.com/burke/zeus) para precargar la app y acelerar el tiempo de arranque.

        gem install zeus
        zeus start

6. Arrancar la aplicación

        rails server
        zeus server # Si instalo Zeus

7. Finalmente visitar en el navegador

        localhost:3000 # Aplicación web
        localhost:1080 # Servidor de correos (Mailcatcher)

8. Puedes iniciar sesion con el admin que viene por defecto en las `seeds` (Actualmente no se ha implementado la creación de administradores a traves de la app web).

        email: admin@email.com
        password: password

## Ejecutar las pruebas

La aplicación usa `rspec`, `capybara` y el driver `poltergeist`. Para correr todas las pruebas ejecute:

        bundle exec rspec spec

## Heroku

Para desplegar la aplicación en tu cuenta de Heroku sólo ejecuta los siguiente comandos:

1. `heroku login`
2. `heroku create`
3. `git push heroku master`

## API

Por seguridad, la API cuenta con **HTTP Basic Authentication**. Las credenciales estan definidas en el archivo `.env`.

La version mas actual de la API es **v1**
