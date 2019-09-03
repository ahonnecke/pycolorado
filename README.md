![Hyperbolic XKCD about local python environments](https://imgs.xkcd.com/comics/python_environment.png)

# Goals
* Version control external dependencies
* Make testing fast and automatic
* Minimize onboarding time
* Streamline CI/CD

# Method
1. Virtual Environments (venv)
2. Package Management (pip)
3. Containerization (docker)
3. Service composition (docker-compose)

We're going to look at an open source project that offers virtual environments, and a Dockerfile,
but does not yet have a docker-compose defined

# Concentric circles model
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


== Version control external dependencies
== Make testing fast and automatic
== Minimize onboarding time
== Streamline CI/CD

<
