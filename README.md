# Cleaning Up Your Python Superfund Site
A presentation about effective application isolation

# [XKCD 1987](https://xkcd.com/1987/)
![Hyperbolic XKCD about local python environments](https://imgs.xkcd.com/comics/python_environment.png)

###                    PyColorado
###                September 9th 2019
####                  Ashton Honnecke

# Goals
## Understand the value that containers can offer, why, when and how to utilize them.
* Version control external dependencies
* Make testing fast and automatic
* Minimize onboarding time
* Streamline CI/CD

# Method
1. Virtual Environments (venv)
2. Package Management (pip)
3. Containerization (docker)
3. Service composition (docker-compose)

We're going to look at an
[open source high frequency cryptocurrency trading bot](https://github.com/freqtrade/freqtrade)
that offers [virtual environments](https://github.com/freqtrade/freqtrade/blob/develop/setup.sh#L148),
and a [Dockerfile](https://github.com/freqtrade/freqtrade/blob/develop/Dockerfile),
but does not [yet have a docker-compose defined](https://github.com/freqtrade/freqtrade/pull/2219).

## Local uncontainerized venv

``` bash
source .env/bin/activate
```

``` bash
python -i
import ccxt
```

# Local uncontainerized build

``` bash
docker build .
```

``` bash
docker run .
```


# Concentric Circles Model
You can think of your application as a kernel of code in the middle of several concentric
circles, like invisible matryoshka dolls around your application. You want to be in complete
control of the environment your application is running inside of, completely independent of
any external requirements, libraries or services.

```
                                  ,&@@@@@@@@@@@@@@@@@@@@@&,
                            #@@@@@@@@@@@&(/////////((&@@@@@@@@@@@#
                        @@@@@@@,                             ,@@@@@@@
                     @@@@@@             Docker Compose             @@@@@@
                   @@@@@.                                             .@@@@@
                @@@@*                                                   *@@@@
              @@@@                 ,@@@@@@@@@@@@@@@@@@@@@,                 @@@@
            @@@@              *@@@@@@@@@(,....... .,(@@@@@@@@@*              @@@@
           @@@*            &@@@@@.                         .@@@@@&            *@@@
         *@@@            @@@@&            Dockerfile           &@@@@            @@@*
        @@@@           @@@@                                       @@@@           @@@@
       @@@@          @@@@              %@@@@@@@@@@@@@%              @@@@          @@@@
      #@@@          @@@.          &@@@@@@@@@@@@@@@@@@@@@@@&          .@@@          @@@#
      @@@         *@@@         /@@@@%                   %@@@@/         @@@*         @@@
     @@@         .@@@         @@@@                         @@@@         @@@.         @@@
    ,@@%         @@@        &@@@           Pipenv            @@@&        @@@         %@@,
    @@@         @@@        @@@%                               %@@@        @@@         @@@
    @@@         @@@        @@@         @@@@@@@@@@@@@@@         @@@        @@@         @@@
    @@&        ,@@(       @@@        %@@@           @@@%        @@@       (@@,        &@@
    @@(        #@@.       @@@        @@@     The     @@@        @@@       .@@#        (@@
    @@/        #@@.       @@@        @@@     App     @@@        @@@       .@@#        /@@
    @@&        ,@@(       @@@        %@@@           @@@%        @@@       (@@,        &@@
    @@@         @@@        @@@         @@@@@@@@@@@@@@@         @@@        @@@         @@@
    @@@         @@@        @@@%                               %@@@        @@@         @@@
    ,@@%         @@@        &@@@            Pipenv           @@@&        @@@         %@@,
     @@@         .@@@         @@@@                         @@@@         @@@.         @@@
      @@@         *@@@         /@@@@%                   %@@@@/         @@@*         @@@
      #@@@          @@@.          &@@@@@@@@@@....@@@@@@@@@&          .@@@          @@@#
       @@@@          @@@@              %@@@@@@@@@@@@@%              @@@@          @@@@
        @@@@           @@@@                                       @@@@           @@@@
         *@@@            @@@@&            Dockerfile           &@@@@            @@@*
           @@@*            &@@@@@.                         .@@@@@&            *@@@
            @@@@              *@@@@@@@@@(,..........,(@@@@@@@@@*              @@@@
              @@@@                 ,@@@@@@@@@@@@@@@@@@@@@,                 @@@@
                @@@@*                                                   *@@@@
                  @@@@@.                                             .@@@@@
                     @@@@@@              Docker Compose           @@@@@@
                        @@@@@@@,                             ,@@@@@@@
                            #@@@@@@@@@@@&((/.....//((&@@@@@@@@@@@#
                                     \\@@&((@@@@@@/((&@@@#
```

## Version control external dependencies

Move all the application requirements *out* of the README, and into one of these layers
of abstraction.

* Deterministic
* Accurate
* Reproducible

If it's not in version control do you really have it?

## Minimize onboarding time (and context switching time)

* How long does it take a new developer to get up to speed?
* What's the opportunity cost associated with the app not being self servicing?

The faster, easier, and more self contained the repository is, the faster your team can
move and grow. Optimize the actions that you take *most often!*

## Make testing fast and automatic

* Tests fail fast

The sooner a test fails (if it was going to fail anyway) the better!

### Make testing easy
The easier it is to run tests, the more often they will be run!

### Test services
* unit
* lint
* database
* fixtures
* integration

You can add these services to your docker-compose such that they spin up in the background
*any time* you run `docker-compose up`

## Streamline CI/CD

If we've done everything right up to this point, moving into a CI/CD process should be
fast and easy!  Just run `docker-compose run unit_test`!

## Freqtrade
https://github.com/freqtrade/freqtrade

### Docker-compose PR
https://github.com/freqtrade/freqtrade/pull/2219

### Code coverage report
https://coveralls.io/builds/25531715

### Travis Job
https://travis-ci.org/freqtrade/freqtrade/jobs/580888541
