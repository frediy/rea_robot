# REA Robot Solution

## Setup

Clone the repo and run setup:

```
git clone https://github.com/theminted/rea_robot
cd rea_robot
./bin/setup
```

## Usage

```
./bin/robot filename
```

## Solution Notes

I have refactored Robot fairly heavily in order to show knowledge of oo design patterns and architecture. I normally would be inclined to leave more of the logic in the Robot class if there is a low chance of it being touched by other developers.

### Other possible improvements

`raise CommandIgnoredError if ignore_commands?` is repeated heavily in Robot. By either implementing a before_filter or moving each command method to its own implementation of a Command baseclass, this can be avoided. Moving commands to their own classes seems useful if there is a high likelihood of new commands being created with logic unique to that command.

While there is enough error handling to meet the problem specification, the application won't fail gracefully for incorrect input. If the application was known to have some chance of receiving incorrect input, I would implement this.

If the test suite grew large and slow, integration tests could be moved to be called directly on CommandsInterpreter, and the executable robot could be tested to ensure that it calls CommandsInterpreter correctly for all input. I did not do this as there is a higher risk of failure if an integration spec isn't exactly simulating the environment it is testing.
